//
//  ViewController.swift
//  StructLIFOExample
//
//  Created by Adrian Pascual Dominguez on 10/2/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    var stackArray = [String]()
    var text : String = ""
    
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


    func push(stringToPush: String){
        self.stackArray.append(text)
    }
    
    func pop() -> String? {
        if self.stackArray.last != nil {
            var stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
    
    
    @IBAction func guadar(_ sender: Any) {
        text = txtName.text!
    }
}

