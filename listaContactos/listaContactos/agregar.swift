//
//  ViewController.swift
//  listaContactos
//
//  Created by Adrian Pascual Dominguez on 29/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class agregar : UIViewController, UITableViewDataSource , UITableViewDelegate, envialosdatosdelformatodelegate {
   
    @IBOutlet weak var tabla: UITableView!
    var nombres : [datosdelformato] = []
    var celdaselecionada : Int = 0
    var datosparamostrar = datosdelformato ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func envialosdatos(datosllenos: datosdelformato) {
        nombres.append(datosllenos)
        tabla.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text  = nombres[indexPath.row].nombre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cambiar" {
            let formato : formato = segue.destination as! formato
            formato.elpuente = self
        }
        
        if segue.identifier == "mostrar"{
            if let datosVc = segue.destination as? mostrar {
                if let datosenviar = sender as? datosdelformato {
                    datosVc.datosamostrar = datosenviar
                }
            }
        }
    }

    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        celdaselecionada = indexPath.row
        let mostrarnombres = nombres[celdaselecionada]
    
        self.performSegue(withIdentifier: "mostrar" , sender: mostrarnombres )
        
    }
}

