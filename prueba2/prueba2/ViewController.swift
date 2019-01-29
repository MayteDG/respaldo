//
//  ViewController.swift
//  prueba2
//
//  Created by Adrian Pascual Dominguez on 06/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBAction func imageButton(_ sender: Any) {
        
        imagenView.image = UIImage(named: "SmallButton")!
        self.view.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        self.crearAlerta(strgAlerta: "rojo")

    }
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imagenView: UIImageView!
    
    @IBAction func Button2(_ sender: Any) {
        imagenView.image = UIImage(named: "SliderTrackRight")!
        self.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.crearAlerta(strgAlerta: "amarillo")
    }
    
    @IBAction func button3(_ sender: Any) {
        imagenView.image = UIImage(named:"SliderTrackLeft")!
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
       
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet ( charactersIn: string)
        return allowCharacters.isSuperset(of: characterSet)
    }

    
    
    func crearAlerta(strgAlerta:String){
        let alert = UIAlertController(title: "Hola", message:strgAlerta, preferredStyle: .actionSheet)
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let action = UIAlertAction(title: "Yes", style: .default, handler: nil)
        
        alert.addAction(action)
        alert.addAction(action2)
        
        self.present(alert, animated: true)
        
    }
    
    
}

