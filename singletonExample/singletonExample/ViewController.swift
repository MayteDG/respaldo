//
//  ViewController.swift
//  singletonExample
//
//  Created by Adrian Pascual Dominguez on 10/25/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let config : configuration = configuration.defaultconfiguration
 
    
    @IBOutlet weak var txtfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
      config.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
         // As this page is loaded, just show the value in the variable.
        print ("page1 - Current Number = \(GlobalVariables.sharedManager.myName)")
        // On returning from page two, you will be able to see that the variable has
        // been changed, showing persistence of that variable across two pages.

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = config.backgroundColor
    }

    
    @IBAction func agregar(_ sender: Any) {
        
    }
    
    
    @IBAction func imprimit(_ sender: Any) {
      
       
    }
    
    
    @IBAction func singleton(_ sender: Any) {
      
    }
    
}

