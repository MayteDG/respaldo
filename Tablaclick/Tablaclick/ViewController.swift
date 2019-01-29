//
//  ViewController.swift
//  Tablaclick
//
//  Created by Adrian Pascual Dominguez on 12/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text  = teams[indexPath.row]
        cell.imageView!.image = UIImage(named: teams[indexPath.row])!
        
        
        return cell
    }
    
    
      var teams : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
         teams = ["Atletico de Madrid", "Barcelona", "Las Palmas", "Malaga", "Rayo Vallecano", "Sporting", "Real Sociedad", "Espanyol", "Mallorca", "Valladolid", "Eibar",  "Ponferradina", "Albacete"]
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

