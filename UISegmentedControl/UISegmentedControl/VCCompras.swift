//
//  VCCompras.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/23/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class VCCompras: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var datos : [Empresa2] = Empresa2.arraydeinformacion2()
    var compras = Empresa2 ()
    var config : ProductosSeleccionados = ProductosSeleccionados.dataSave
    
    var costoTotal : Int = 0
    var costoactual : Int = 0
    var NumArticulos : Int = 1
    var Total : [Int] = []
    var NoSelect : Bool = true
    
    var precioArticulo : Int = 50
    
    var DataCanasta : [Empresa2] = []
    
    @IBOutlet weak var lblNArticulos: UILabel!
    @IBOutlet weak var TVCompras: UITableView!
    @IBOutlet weak var btnAgregar: UIButton!
    
    
    @IBOutlet weak var lblNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lblNombre.text = "Hamburguesa"
        lblNArticulos.text = "1"
        btnAgregar.setTitle("Agregar $\(precioArticulo)", for: .normal)
        TVCompras.register(UINib(nibName: "TVCCompras", bundle: nil), forCellReuseIdentifier: "TVCCompras")
       TVCompras.delegate = self
       TVCompras.dataSource = self
    }
   /* func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Escoge Algo"
    }*/
    
   /* func numberOfSections(in tableView: UITableView) -> Int {
        return 0    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TVCompras.dequeueReusableCell(withIdentifier: "TVCCompras", for: indexPath) as! TVCCompras
        cell.lblnamecomplemento.text = datos[indexPath.row].nombreempresa2
        cell.lblPrecioComplemento.text = String (datos[indexPath.row].precio2)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TVCompras.deselectRow(at: indexPath, animated: true)
    let cell = TVCompras.cellForRow(at: indexPath)
    let selecion = datos[indexPath.row]
        let addTwo: (Int, Int) -> Int = { x, y in x + y }
    if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
               if Total.count < 1 {
                costoactual = precioArticulo * NumArticulos
                print ("total es cero \(costoactual)")
               }
              else {
              Total.remove(at: indexPath.row)
              let numberSum = Total.reduce(0, addTwo)
              costoactual = numberSum + (precioArticulo * NumArticulos)
              btnAgregar.setTitle("Agregar $\(costoactual)", for: .normal)
              }

        }else {
            cell?.accessoryType = .checkmark
            NoSelect = false
            Total.append(selecion.precio2)
            let numberSum = Total.reduce(0, addTwo)
            costoactual = numberSum + (precioArticulo * NumArticulos)
             btnAgregar.setTitle("Agregar $\(costoactual)", for: .normal)
        }
    }
    
   
    @IBAction func btnSuma(_ sender: Any) {
        if NumArticulos  > 0 {
        NumArticulos = NumArticulos + 1}
        lblNArticulos.text = String (NumArticulos)
        //es didSelect es true cuando ninguna celda esta seleccionado.
        if NoSelect == true
        {costoTotal = NumArticulos * precioArticulo
            btnAgregar.setTitle("Agregar $\(costoTotal)", for: .normal)}
        else {
         costoTotal = costoactual * NumArticulos
         btnAgregar.setTitle("Agregar $\(costoTotal)", for: .normal)
        }
    }
  
    @IBAction func btnResta(_ sender: Any) {
        if NumArticulos > 1 {
            NumArticulos = NumArticulos - 1
            lblNArticulos.text = String (NumArticulos)
            if NoSelect == true
            { costoTotal = costoTotal - precioArticulo
                btnAgregar.setTitle("Agregar $\(costoTotal)", for: .normal)}
            else {
                costoTotal = costoTotal - costoactual
                btnAgregar.setTitle("Agregar $\(costoTotal)", for: .normal)
            }
        }
        else {
            NumArticulos = 1
        }
        
    
    }
 
    @IBAction func btnAgregars(_ sender: Any) {
        if  NoSelect == true {
            costoTotal = NumArticulos * precioArticulo
            compras.precio2 = costoTotal
            compras.nombreempresa2 = lblNombre.text!
            
        }else {
            compras.precio2 = costoTotal
            compras.nombreempresa2 = lblNombre.text!
           
        }
    }
    
    //performSegue(withIdentifier: "canastaCompras", sender: nil)
}
