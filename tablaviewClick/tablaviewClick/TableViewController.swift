//
//  TableViewController.swift
//  tablaviewClick
//
//  Created by Adrian Pascual Dominguez on 14/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class Equipo:NSObject {
    
    var nombre:String?
    var logo : String?
    var Presupuesto: String?
    var NumJugadores:String?
    
   // var jugadores : [Jugador]
    override init(){
        nombre = ""
        logo = ""
        Presupuesto = "1111"
        NumJugadores = "12"
    }
    
}

class TableViewController: UITableViewController  {
    
    
    var arrayOfCellData: NSMutableArray? = nil
    var teams = ["Atletico de Madrid", "Barcelona", "Las Palmas", "Malaga", "Rayo Vallecano"]
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
         self.tableView.register(UINib(nibName:"TableViewCell", bundle: nil), forCellReuseIdentifier: "celdaBasica")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrayOfCellData!.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "celdaBasica") as! TableViewCell
        
        let equipo:Equipo = arrayOfCellData?.object(at: indexPath.row) as! Equipo
  
        cell.mainImage.image = UIImage(named: equipo.logo!)
        
        cell.mainLabel.text = equipo.nombre
        
        return cell
    }
    
    
}

