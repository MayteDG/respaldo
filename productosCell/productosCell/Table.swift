//
//  ViewController.swift
//  productosCell
//
//  Created by Adrian Pascual Dominguez on 28/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class Table : UITableViewController {
    
    var otrosdatos = producto.productosParaLista()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewdidload")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(otrosdatos.count)")
        return otrosdatos.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> UITableViewCell {
        let unacelda = tableView.dequeueReusableCell(withIdentifier: "celdita") as! ViewCell
        
        unacelda.lbldesc.text = otrosdatos[indexPath.row].descripcion
        unacelda.lblprecio.text = otrosdatos[indexPath.row].precio
        
        return unacelda
        
    }
}


