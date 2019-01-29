//
//  LlenardatosViewController.swift
//  vistasPrueba
//
//  Created by Adrian Pascual Dominguez on 16/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

protocol regresaDatosaVC1Delegate {
    
    func regresalosdatos(datosllenadospersona:InformaciondePersona)
}

class LlenardatosViewController: UIViewController {
    
    var delegate : regresaDatosaVC1Delegate?
    var personainfor : InformaciondePersona?
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var estadoCivil: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre.text = personainfor?.Nombre
        apellido.text = personainfor?.Apellido
        estadoCivil.text = personainfor?.EstadoCivil
    
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    
        }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func validarDatos()-> Bool {
        if nombre.text == ""{
            self.mensajealerta(texto: "Llena el nombre")
            return false
        }
        
        if apellido.text == "" {
            self.mensajealerta(texto: "Llena el apellido")
            return false
        }
        
        if estadoCivil.text == ""{
            self.mensajealerta(texto: "LLena el estado civil")
            return false
        }
        
        return true
    }
    
    
    
    func mensajealerta (texto : String){
        let alert = UIAlertController(title: "Alerta", message: texto, preferredStyle: UIAlertControllerStyle.alert)
       
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    
    }

    func guardardatos () -> InformaciondePersona {
        personainfor?.Nombre = nombre.text!
        personainfor?.Apellido = apellido.text!
        personainfor?.EstadoCivil = estadoCivil.text!
        return personainfor!
    }
    
    @IBAction func btnGuardarDatos(_ sender: Any) {
        if validarDatos() {
            let personaGuardada =  guardardatos()
            if  (delegate != nil) {
                
                delegate?.regresalosdatos(datosllenadospersona: personaGuardada)
                self.navigationController?.popViewController(animated: true)
            }
            
                
                
            }
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
