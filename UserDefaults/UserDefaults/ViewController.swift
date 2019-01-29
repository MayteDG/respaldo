//
//  ViewController.swift
//  UserDefaults
//
//  Created by Jorge Maldonado Borbón on 12/08/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var texto: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardar(_ sender: UIButton) {

        if texto.text == ""{
            
            let alerta = UIAlertController(title: "alerta", message: "Escribe algo", preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alerta.addAction(ok)
            present(alerta, animated: true, completion: nil)
            
        }else{
            // Guarda el valor en UserDefault
            UserDefaults.standard.set(texto.text, forKey: "valor")
            texto.text = ""
            //desaparece el teclado cuando al tocar el boton
            texto.resignFirstResponder()
        }
    }
    
    @IBAction func mostrar(_ sender: UIButton) {
//Trae el valor que se guardo a anteriormete con (object)
        let  resultado = UserDefaults.standard.object(forKey: "valor")
        texto.text = resultado as? String
    }
    
// Desaparece el teclado cuando le das clic en cualquier parte de la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

