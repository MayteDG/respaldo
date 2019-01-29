//
//  secondViewController.swift
//  prueba2
//
//  Created by Adrian Pascual Dominguez on 06/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    
    @IBAction func buttonpicker(_ sender: Any) {
        
    
    }
    
    
    
    
    @IBOutlet weak var inputtext: UITextField!
    
    private var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dataChanged(datePicker:)), for: .valueChanged)
        
        let  tapGesture = UITapGestureRecognizer (target: self, action:#selector(self.viewTapped(gestureRecognizer:)))
        
       self.view.addGestureRecognizer(tapGesture)
        
        inputtext.inputView = datePicker
        }
    
     @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
        
        }
    
     @objc func dataChanged (datePicker:UIDatePicker){
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        inputtext.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
