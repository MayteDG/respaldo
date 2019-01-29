//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Adrian Pascual Dominguez on 9/28/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var lblNombre: UITextField!
    @IBOutlet weak var lblEdad: UITextField!
    @IBOutlet weak var swtchOpcionales: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//1.Hace referencia al contenedor que esta configurado en AppDelegate
    func conexionCoreData () -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    @IBAction func btnGuardar(_ sender: UIButton) {
        
//1.1 Usar la referencia solo cuando  ocurra un evento
        let contexto = conexionCoreData()
// Crea nuevos registros de usuario
        let entidaddePersonas = NSEntityDescription.entity(forEntityName: "Personas", in: contexto)
//Aqui se va a guardar la informacion de la nueva persona
        let nuevapersona = NSManagedObject(entity: entidaddePersonas!, insertInto: contexto)
        
        let edadpersona = Int16(lblEdad.text!)
        
        nuevapersona.setValue(lblNombre.text , forKey: "nombre")
        nuevapersona.setValue(edadpersona , forKey: "edad")
        nuevapersona.setValue(swtchOpcionales.isOn, forKey: "activo")
        
        do {
            try contexto.save()
            print ("Guardado")
            lblNombre.text = ""
            lblEdad.text = ""
            swtchOpcionales.isOn = false
        } catch let error as NSError {
            print("No se pudo guardar",error)
        }
    }
    
}

