//
//  ViewController.swift
//  test
//
//  Created by Adrian Pascual Dominguez on 05/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var label: UILabel!
    var algomas = test.regresacosas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    imagen.image = algomas.imagen
    label.text = algomas.texto
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

