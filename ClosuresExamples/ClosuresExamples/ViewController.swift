//
//  ViewController.swift
//  ClosuresExamples
//
//  Created by Adrian Pascual Dominguez on 13/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var lblUno: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //var completionHandler:((String) -> Int)?
        
        // (color:UIColor)->()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    //Ejemplo Closure
    @IBAction func BtnClick(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bloqueQueCambiaDeColor = {(color : UIColor) in
            DispatchQueue.main.async {
                self.view.backgroundColor = color
            }
        }
        
        let dest = segue.destination as! VCDos
        dest.miVariableenVC2detipoBloque = bloqueQueCambiaDeColor //A12
        
    }
    
}
