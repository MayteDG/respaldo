//
//  ViewController.swift
//  TxtfieldWihtImage
//
//  Created by Adrian Pascual Dominguez on 30/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtusuario: UITextField!
    
    @IBOutlet weak var txtmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = UIImage(named : "images")
        imagenalaizquierda(textfiel: txtusuario, imagenes: #imageLiteral(resourceName: "images"))

    }

    func imagenalaizquierda (textfiel : UITextField, imagenes : UIImage){
        
        let imagenizquierda = UIImageView (frame: CGRect(x: 0.0 , y : 0.0 , width : imagenes.size.width, height: imagenes.size.height))
        imagenizquierda.image = imagenes
        textfiel.leftView = imagenizquierda
        textfiel.leftViewMode = .always
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

