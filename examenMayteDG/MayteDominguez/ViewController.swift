//
//  ViewController.swift
//  MayteDominguez
//
//  Created by Mayte Dominguez on 10/18/18.
//  Copyright © 2018 Mayte Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EnvioDeDatosDelegate {
    
    
    @IBOutlet weak var showData: UIView!
    @IBOutlet weak var lblDatos: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFechaNac: UILabel!
    @IBOutlet weak var lblNivelEstud: UILabel!
    @IBOutlet weak var lblCelular: UILabel!
    @IBOutlet weak var lblEdoCivil: UILabel!
    @IBOutlet weak var lblSiNo: UILabel!
    @IBOutlet weak var lblTyC: UILabel!
    
    var tyC = "EmpresaB S.A de C.V no realizará la difusion de datos personales a sus empresas adyacentes ni a ninguna otra empresa externa sin el concentimiento del cliente. La empresa B se hace responsable del respaldo de informacion de todos sus clientes."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Vista Principal"
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    self.navigationController?.navigationBar.barTintColor = UIColor.white
        showData.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    func datos(informacion: Datos) {
       lblDatos.isHidden = true
       showData.isHidden = false
       lblNombre.text =  informacion.Name
       lblFechaNac.text = informacion.FechaNacimiento
       lblNivelEstud.text = informacion.NivelEstud
       lblCelular.text = informacion.NumeroDeCel
       lblEdoCivil.text = informacion.EdoCivil
       
        if informacion.AceptaTyC {
            lblSiNo.text = "Si aceptó"
            lblTyC.text = tyC
        }
        else{
            lblSiNo.text = "No aceptó"
            lblTyC.text = ""
        }
  
    }
 
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguedatos"{
            let VCData : VCData = segue.destination as! VCData
            VCData.delegate = self
        }
    }
    
    func GetUsserDefault () {
         let name1 = UserDefaults.standard.object(forKey: "Nombre")
         let fecha1 = UserDefaults.standard.object(forKey: "Fecha")
         let estudio1 = UserDefaults.standard.object(forKey: "Estudio")
         let cel1 = UserDefaults.standard.object(forKey: "Cel")
         let civil1 = UserDefaults.standard.object(forKey: "Civil")
        let switc1 = UserDefaults.standard.bool(forKey: "Si")
           
        
            lblDatos.isHidden = true
            showData.isHidden = false
            lblNombre.text = name1 as? String
            lblFechaNac.text = fecha1 as? String
            lblNivelEstud.text = estudio1 as? String
            lblCelular.text = cel1 as? String
            lblEdoCivil.text = civil1 as? String
       
        if switc1 {
            lblSiNo.text = "Si aceptó"
            lblTyC.text = tyC
        }
        else{
            lblSiNo.text = "No aceptó"
            lblTyC.text = ""
        }
}


    @IBAction func DatosGuardados(_ sender: Any) {
        GetUsserDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblDatos.isHidden = false
        showData.isHidden = true
    }
}
