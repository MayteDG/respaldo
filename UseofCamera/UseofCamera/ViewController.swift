//
//  ViewController.swift
//  UseofCamera
//
//  Created by Adrian Pascual Dominguez on 12/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
   
    @IBOutlet weak var imageTake: UIImageView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TomarFoto(_ sender: Any) {
        //MARK: - Take image
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil) }
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }

 
}
