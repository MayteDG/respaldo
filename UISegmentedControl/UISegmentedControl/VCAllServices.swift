//
//  VCAllServices.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class VCAllServices: UIViewController, UITableViewDelegate, UITableViewDataSource, servicioSelectionDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    var datos : Empresa?
    var selection : Empresa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "TVCBalance", bundle: nil), forCellReuseIdentifier: "TVCBalance")
        tableview.register(UINib(nibName: "TVCServicios", bundle: nil), forCellReuseIdentifier: "TVCServicios")
        tableview.register(UINib(nibName: "TVCAllOptions", bundle: nil), forCellReuseIdentifier: "TVCAllOptions")
        tableview.register(UINib(nibName:"TVCPromociones", bundle: nil), forCellReuseIdentifier: "TVCPromociones")
        
        tableview.delegate = self
        tableview.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        else if indexPath.section == 1 {
            return 120
        }
        else  if indexPath.section == 2{
            return 190
        }
        else {
            return 160 
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        
        else if section == 2 {
            return 1
        }
        
        else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 3 {
            return ("Promociones")
        }
        else {
           return ("")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
        let celda = tableView.dequeueReusableCell(withIdentifier: "TVCBalance", for: indexPath) as! TVCBalance
            celda.selectionStyle = .none
        
        return celda
        }
    
        else  if indexPath.section == 1{
             let celda = tableView.dequeueReusableCell(withIdentifier: "TVCServicios", for: indexPath) as! TVCServicios
            //celda.selectionStyle = .none
            celda.delegate = self
            return celda
        }
    
        else if indexPath.section == 2 {
            let celda = tableView.dequeueReusableCell(withIdentifier: "TVCAllOptions", for: indexPath) as!
            TVCAllOptions
            celda.selectionStyle = .none
            
            return celda
        }
        else {
            let celda = tableview.dequeueReusableCell(withIdentifier: "TVCPromociones", for: indexPath) as! TVCPromociones
            celda.selectionStyle = .none
            
            return celda
        }
    }

   
    
    func Clickselection(selection: Empresa) {
       performSegue (withIdentifier: "seguerestaurant", sender: nil )
        print (selection.nombreempresa)
    }
  
    
    
}
