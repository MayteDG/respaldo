//
//  SecondViewController.swift
//  tablaviewClick
//
//  Created by Adrian Pascual Dominguez on 12/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    var myCell : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        label.text = myCell
        //cell.imageView!.image = UIImage(named: teams[indexPath.row])!
        
        if let esdiferentedenulo = UIImage(named: myCell){
            imageVIew.image = esdiferentedenulo
        }
        
        
    }

    @IBAction func clickBtnClosedView(_ sender: Any) {
        self.cerrarVista()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func cerrarVista(){
        self.dismiss(animated: true) {
            
        }
        
    }
    func crearObjetosEquipo()-> NSMutableArray{
        let arrayOfCellData : NSMutableArray? = NSMutableArray()
        let teams = ["Atletico de Madrid", "Barcelona", "Las Palmas", "Malaga", "Rayo Vallecano"]
        
        for item in teams{
            let equipo : Equipo = Equipo()
            equipo.logo = item
            equipo.nombre = item
            equipo.Presupuesto = "123123"
            equipo.NumJugadores = "12"
            arrayOfCellData?.add(equipo)
        }
        
        let equipoE : Equipo = Equipo()
        equipoE.logo = "Ponferradina"
        equipoE.nombre = "Ponferradina"
        equipoE.Presupuesto = "12000000"
        equipoE.NumJugadores = "22"
        arrayOfCellData?.add(equipoE)
        return arrayOfCellData!
    }


        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
       if(segue.identifier == "atercera"){
            var dest = segue.destination as! TableViewController
            dest.arrayOfCellData = self.crearObjetosEquipo()
        }
    }
 

}
