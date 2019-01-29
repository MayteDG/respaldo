//
//  ViewController.swift
//  firstView
//
//  Created by Adrian Pascual Dominguez on 23/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

struct infor {
    let celda : Int
    let precio : String
    let infor: String
    let entrega: String
}

class TableViewController: UITableViewController {
  var arraydeinfor = [infor]()
  var celdaseleccionada = 0
    
    override func viewDidLoad() {
        arraydeinfor = [infor ( celda : 1, precio : "$11,699", infor : "Vendido por Hudson Bay 2.0 (8 opiniones)", entrega : " Fecha estimada de entrega: Pronto tendremos la fecha de entrega de este producto."),
            infor (celda : 1, precio : "$12,639", infor : "Vendido por Smeg 3.0 (8 opiniones)", entrega : " Fecha estimada de entrega: Pronto tendremos la fecha de entrega de este producto.")]
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraydeinfor.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arraydeinfor[indexPath.row].celda == 1 {
            
            let celda = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
        celda.lblPrecio.text = arraydeinfor [indexPath.row].precio
        celda.lblOpinion.text = arraydeinfor[indexPath.row].infor
        celda.lblEntrega.text = arraydeinfor[indexPath.row].entrega
        
        
            return celda
        
        }
        else {
            let celda = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
             celda.lblPrecio.text = arraydeinfor [indexPath.row].precio
             celda.lblOpinion.text = arraydeinfor[indexPath.row].infor
             celda.lblEntrega.text = arraydeinfor[indexPath.row].entrega
            
            return celda
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arraydeinfor[indexPath.row].celda == 1 {
            return 209
        }
            
        else {
            return 209
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let miDestino = segue.destination as! ViewController
            miDestino.lblDescripcion.text? = arraydeinfor[celdaseleccionada].infor
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        celdaseleccionada = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

