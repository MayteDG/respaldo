//
//  ViewController.swift
//  ejempDelegatesImages
//
//  Created by Adrian Pascual Dominguez on 27/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class receiving: UIViewController , CambiodeColorDelegate {
    
    func cambiardecolor(_ color: UIColor) {
        view.backgroundColor = color
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    if let envia = segue.destination as? sending
    let sending = nav.topViewController as? sending {
        sending.delegate = self
    }

}

