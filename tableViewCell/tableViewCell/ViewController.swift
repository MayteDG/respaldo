//
//  ViewController.swift
//  tableViewCell
//
//  Created by Adrian Pascual Dominguez on 22/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

struct datosdCelda {
    let celda : Int
    let texto : String
    let image : UIImage
}


class TableViewController: UITableViewController {
    
    var arraydDatos = [datosdCelda] ()
    
    override func viewDidLoad() {
        
    arraydDatos = [datosdCelda (celda : 1, texto : "Primer Celda", image : #imageLiteral(resourceName: "SliderTrackLeft")),
                       datosdCelda (celda : 2, texto : "Segunda Celda", image : #imageLiteral(resourceName: "SliderTrackRight")),
                       datosdCelda (celda : 1, texto : "Tercer Celda", image : #imageLiteral(resourceName: "SliderTrackLeft")),]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraydDatos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arraydDatos[indexPath.row].celda == 1 {
            
            let celda = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            
            celda.firstImageView.image = arraydDatos[indexPath.row].image
            celda.firstLabel.text = arraydDatos[indexPath.row].texto
            
            return celda
        }
        else if arraydDatos[indexPath.row].celda == 2 {
            let celda = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            celda.scndImageView.image = arraydDatos[indexPath.row].image
            celda.scndLabel.text = arraydDatos [indexPath.row].texto
            
            return celda
            
        }
        else {
            let celda = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            celda.firstImageView.image = arraydDatos[indexPath.row].image
            celda.firstLabel.text = arraydDatos[indexPath.row].texto
        
            return celda
        }
        
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arraydDatos[indexPath.row].celda == 1 {
            return 202
        }
        else if arraydDatos[indexPath.row].celda == 2{
            return 93
        }
        else {
            return 202
        }
    }
    
}

