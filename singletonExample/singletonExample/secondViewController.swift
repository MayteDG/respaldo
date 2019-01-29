//
//  secondViewController.swift
//  singletonExample
//
//  Created by Adrian Pascual Dominguez on 10/25/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    let config : configuration = configuration.defaultconfiguration
    
    @IBOutlet weak var lblmostrar: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = config.backgroundColor
        // Show what it is now
        print ("page2 - Current Number = \(GlobalVariables.sharedManager.myName)")
        // Change it
        GlobalVariables.sharedManager.myName = "Chris"
        // Show what it is after the change.
        print ("page2 - Changed Number = \(GlobalVariables.sharedManager.myName)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
