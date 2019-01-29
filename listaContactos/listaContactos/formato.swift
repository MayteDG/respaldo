//
//  formato.swift
//  listaContactos
//
//  Created by Adrian Pascual Dominguez on 29/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class formato: UIViewController {
    
    var guardalosdatos =  datosdelformato ()
    var elpuente : envialosdatosdelformatodelegate?
    
    @IBOutlet weak var txtnombre: UITextField!
    @IBOutlet weak var txtapellido: UITextField!
    @IBOutlet weak var txtempresa: UITextField!
    @IBOutlet weak var txtnumerodetel: UITextField!
    @IBOutlet weak var txtdireccion: UITextField!
    @IBOutlet weak var txtcumpleaño: UITextField!
    @IBOutlet weak var txtfacebook: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Guardar(_ sender: Any) {
      guardalosdatos.nombre = txtnombre.text!
      guardalosdatos.apellido = txtapellido.text!
      guardalosdatos.empresa = txtempresa.text!
      guardalosdatos.numerotel = txtnumerodetel.text!
      guardalosdatos.direccion = txtdireccion.text!
      guardalosdatos.cumpleaños = txtcumpleaño.text!
      guardalosdatos.facebook = txtfacebook.text!
        
      let todoslosdatos = guardalosdatos
      elpuente?.envialosdatos(datosllenos: todoslosdatos)
      self.navigationController?.popViewController(animated: true)
    }
    

}
