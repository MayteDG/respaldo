//
//  ViewController.swift
//  tableViewCont
//
//  Created by Adrian Pascual Dominguez on 23/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
    
    class TableViewController: UITableViewController {
        
        
        struct informacionCelda {
            let celda : Int
            let precio : String?
            let opiniones : String?
            let fechaEntrega: String?
        }
        
        var arraydinfor = [informacionCelda]()
        
        override func viewDidLoad() {
            
            arraydinfor = [informacionCelda( celda : 1, precio : "$11,699", opiniones : "Vendido por Hudson Bay 2.0 (8 opiniones)", fechaEntrega: "Fecha estimada de entrega: Pronto tendremos la fecha de entrega de este producto."),
                           informacionCelda (celda: 2, precio : "$11,920", opiniones: "Vendido por Smeg 2.0 (8 opiniones)", fechaEntrega :"Fecha estimada de entrega: Pronto tendremos la fecha de entrega de este producto.")]
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return arraydinfor.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if arraydinfor[indexPath.row].celda == 1 {

                let celda = Bundle.main.loadNibNamed("TableViewCellfirst", owner: self, options: nil)?.first as! TableViewCellfirst
                
                celda.lblprecio.text = arraydinfor[indexPath.row].precio
                celda.lblopinio.text = arraydinfor[indexPath.row].opiniones
                celda.lblFchEntrega.text = arraydinfor[indexPath.row].fechaEntrega
                
                
                return celda
            }
            else {
                let celda = Bundle.main.loadNibNamed("TableViewCellfirst", owner: self, options: nil)?.first as! TableViewCellfirst
                
                celda.lblprecio.text = arraydinfor[indexPath.row].precio
                celda.lblopinio.text = arraydinfor[indexPath.row].opiniones
                celda.lblFchEntrega.text = arraydinfor[indexPath.row].fechaEntrega
                
                return celda
                
            }
        }
        
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 180
        }
        
    }





