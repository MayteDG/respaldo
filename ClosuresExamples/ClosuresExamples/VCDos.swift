//
//  VCDos.swift
//  ClosuresExamples
//
//  Created by Adrian Pascual Dominguez on 13/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit


class VCDos: UIViewController {

    
    @IBOutlet weak var lbl2: UILabel!

    var miVariableenVC2detipoBloque: ((UIColor)->())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Closure
    
    @IBAction func BtnClosure(_ sender: Any) {
        print("funciono igual que un delegado")
        miVariableenVC2detipoBloque!(UIColor.yellow)
        self.dismiss(animated: true, completion: nil)
        
    }
    
  
    
    
    
    

}
