//
//  ViewControllerB.swift
//  passData
//
//  Created by Adrian Pascual Dominguez on 15/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
protocol ViewControllerBDelegate {
    
     func textChanged(text:String?)
}

class ViewControllerB: UIViewController {
    
     var delegate: ViewControllerBDelegate?
    
    @IBOutlet weak var label: UILabel!
    
    var text : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        self.view.addGestureRecognizer(tap)
        label.text = text
        // Do any additional setup after loading the view.
    }
    
     @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func btnUpperCase(_ sender: Any) {
        
        label?.text = label?.text?.uppercased()
       // delegate?.textChanged(text: label?.text)
    }
    
    @IBAction func BtnLowerCase(_ sender: Any) {
        label?.text = label?.text?.lowercased()
       // delegate?.textChanged(text: label?.text)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         delegate?.textChanged(text: label?.text)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
