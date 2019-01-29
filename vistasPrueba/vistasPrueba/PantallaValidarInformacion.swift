//
//  PantallaValidarInformacion.swift
//  vistasPrueba
//
//  Created by Adrian Pascual Dominguez on 16/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class PantallaValidarInformacion: UIViewController {

    
    @IBOutlet weak var btnaceptarContrato: UIButton!
    var contratoAceptado : Bool? = false
    
    @IBAction func btnaceptarContrato(_ sender: Any) {
        if contratoAceptado == false {
            contratoAceptado = true
            btnaceptarContrato.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        }
        else {
            contratoAceptado = false
            btnaceptarContrato.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    @IBOutlet weak var lblNombre: UILabel!
    var persona : InformaciondePersona? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombre.text = persona?.Nombre
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
