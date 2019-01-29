//
//  ViewController.swift
//  vistasPrueba
//
//  Created by Adrian Pascual Dominguez on 16/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit



class ViewController: UIViewController, regresaDatosaVC1Delegate {
  
    
    @IBOutlet weak var lblrevisa: UILabel!
    
    
    func regresalosdatos(datosllenadospersona: InformaciondePersona) {
        self.persona = datosllenadospersona
        lblrevisa.text = persona?.Apellido
    }
    

    
    @IBAction func btnLlenarInformacion(_ sender: Any) {
    }
    
    var persona : InformaciondePersona? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        persona = InformaciondePersona()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hometofillinfo"{
            let siguientepantalla = segue.destination as! LlenardatosViewController
            siguientepantalla.personainfor = persona
            siguientepantalla.delegate = self
        }
        
        if segue.identifier == "seguevalidar"{
            let objPantallaValidarInformacion:PantallaValidarInformacion = segue.destination as!
                PantallaValidarInformacion
            objPantallaValidarInformacion.persona = self.persona
            
     
        }
        
        
    }

}

