

import UIKit

struct PhotoManagerNotification {
  // Notification when new photo instances are added
  static let contentAdded = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentAdded")
  // Notification when content updates (i.e. Download finishes)
  static let contentUpdated = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentUpdated")
}

struct PhotoURLString {
  // Photo Credit: Devin Begley, http://www.devinbegley.com/
  static let overlyAttachedGirlfriend = "https://i.imgur.com/UvqEgCv.png"
  static let successKid = "https://i.imgur.com/dZ5wRtb.png"
  static let lotsOfFaces = "https://i.imgur.com/tPzTg7A.jpg"
}

typealias PhotoProcessingProgressClosure = (_ completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (_ error: NSError?) -> Void

final class PhotoManager {
  private init() {}
  static let shared = PhotoManager()
  
  private var unsafePhotos: [Photo] = []
  
  var photos: [Photo] {
    return unsafePhotos
  }
  
  func addPhoto(_ photo: Photo) {
    unsafePhotos.append(photo)
    DispatchQueue.main.async { [weak self] in
      self?.postContentAddedNotification()
    }
  }
  
  func downloadPhotos(withCompletion completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [PhotoURLString.overlyAttachedGirlfriend,
                    PhotoURLString.successKid,
                    PhotoURLString.lotsOfFaces] {
                      let url = URL(string: address)
                      let photo = DownloadPhoto(url: url!) { _, error in
                        if error != nil {
                          storedError = error
                        }
                      }
                      PhotoManager.shared.addPhoto(photo)
    }
    
    completion?(storedError)
  }
  
  private func postContentAddedNotification() {
    NotificationCenter.default.post(name: PhotoManagerNotification.contentAdded, object: nil)
  }
}
