//
//  ViewController.swift
//  tablaviewClick
//
//  Created by Adrian Pascual Dominguez on 12/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentItem: String = ""
    var teams: [String] = []

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "enviasegue"{
            let miDestino = segue.destination as! SecondViewController
            miDestino.myCell = currentItem
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return teams.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       currentItem = teams[indexPath.row]
        self.performSegue(withIdentifier: "enviasegue", sender: nil)
    }
    
    //Rellena la vista de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        //Devuelve el recuento total de las filas en la vista de tabla
        cell.textLabel?.text  = teams[indexPath.row]
        
        cell.imageView!.image = UIImage(named: teams[indexPath.row])!
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        teams = ["Atletico de Madrid", "Barcelona", "Las Palmas", "Malaga", "Rayo Vallecano", "Sporting", "Real Sociedad", "Espanyol", "Mallorca", "Valladolid", "Eibar",  "Ponferradina", "Albacete"]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

