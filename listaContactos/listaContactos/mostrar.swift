//
//  mostrar.swift
//  listaContactos
//
//  Created by Adrian Pascual Dominguez on 29/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class mostrar: UIViewController {

    @IBOutlet weak var lblmostrar: UILabel!
    @IBOutlet weak var lblapellido: UILabel!
    @IBOutlet weak var lblempresa: UILabel!
    @IBOutlet weak var lblnumerodetel: UILabel!
    @IBOutlet weak var lbldireccion: UILabel!
    @IBOutlet weak var lblcumpleaño: UILabel!
    @IBOutlet weak var lblfacebook: UILabel!
    
    
    var datosamostrar : datosdelformato?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       lblmostrar.text = datosamostrar?.nombre
       lblapellido.text = datosamostrar?.apellido
       lbldireccion.text = datosamostrar?.direccion
       lblempresa.text = datosamostrar?.empresa
       lblnumerodetel.text = datosamostrar?.numerotel
       lblcumpleaño.text = datosamostrar?.cumpleaños
       lblfacebook.text = datosamostrar?.facebook

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
}

