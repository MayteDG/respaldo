//
//  ViewController.swift
//  passData
//
//  Created by Adrian Pascual Dominguez on 15/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerBDelegate  {
    
    func textChanged(text: String?) {
        labelprincipal.text = text
    }
    
    @IBOutlet weak var labelprincipal: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ViewControllerB = segue.destination as? ViewControllerB {
            ViewControllerB.text = labelprincipal.text
            ViewControllerB.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
       self.view.endEditing(true)
    }
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

