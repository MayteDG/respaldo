//
//  ViewController.swift
//  DocumentPicker
//
//  Created by NK Jagne on 15/09/19.
//  Copyright © 2019 Narendra Jagne. All rights reserved.
//

import UIKit
import MobileCoreServices
import WebKit
import Alamofire

class ViewController: UIViewController, UIDocumentPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
       print ( fileSize(forURL: urls.first!))
            let fileData = try! Data.init(contentsOf: urls.first!)
            let base64String: String = fileData.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
quinta(ddd: base64String)
      }
    
    func fileSize(forURL url: Any) -> Double {
        var fileURL: URL?
        var fileSize: Double = 0.0
        if (url is URL) || (url is String)
        {
            if (url is URL) {
                fileURL = url as? URL
            }
            else {
                fileURL = URL(fileURLWithPath: url as! String)
            }
            var fileSizeValue = 0.0
            try? fileSizeValue = (fileURL?.resourceValues(forKeys: [URLResourceKey.fileSizeKey]).allValues.first?.value as! Double?)!
            if fileSizeValue > 0.0 {
                fileSize = (Double(fileSizeValue) / (1024 * 1024))
            }
        }
        return fileSize
    }
    
    @IBAction func pickDocumeny(_ sender: Any) {
//        let documentPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
//           //Call Delegate
//           documentPicker.delegate = self
//           self.present(documentPicker, animated: true)
//             createAccount(Data: strbase64PDF)
          quinta(ddd: strbase64PDF)
        }
   
}

func trysdc (Stringdd : String) {
      guard let url = URL(string: "http://zafrapp.longbit.mx/update_cv.php") else {
            return
        }

        let data : Data = "mail=a@a.com&cv=\(Stringdd)".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = data

        print("one called")

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // vs let session = URLSession.shared
          // make the request
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in

             if let error = error
            {
                print(error)
            }
             else if let response = response {
                print("her in resposne")

            }else if let data = data
             {
                print("here in data")
                print(data)
            }

            DispatchQueue.main.async { // Correct

                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }

                let decoder = JSONDecoder()
                print(String(data: responseData, encoding: .utf8))
                do {
                  //  let todo = try decoder.decode(T.self, from: responseData)
                  //  NSAssertionHandler(.success(todo))
                } catch {
                    print("error trying to convert data to JSON")
                    //print(error)
                  //  NSAssertionHandler(.failure(error))
                }
            }
        })
        task.resume()
}


public func createAccount(Data:String){

let getInformation = "mail=q@q.com&cv=\(Data)"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    let postData = NSMutableData(data: getInformation.data(using:.utf8)!)

    let request = NSMutableURLRequest(url: NSURL(string: "http://zafrapp.longbit.mx/update_cv.php")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
           DispatchQueue.main.async(execute: {
print (1)
         })
        } else {
             DispatchQueue.main.async(execute: {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
              print (2)
                    
                }
            } catch {
print (3)
            }
          })
        }
    })
    dataTask.resume()
}


func quinta (ddd : String) {
   let headers: HTTPHeaders = ["Content-Type" :"application/x-www-form-urlencoded"]

      let parameters = ["mail":"q@q.com", "cv":ddd]
     Alamofire.request("http://zafrapp.longbit.mx/update_cv.php", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

       switch(response.result) {
       case .success(_):
        
           break

       case .failure(_):
           print(response.result as Any)
           break

       }
      }

   }

