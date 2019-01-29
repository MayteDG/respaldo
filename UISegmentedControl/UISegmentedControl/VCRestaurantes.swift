//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 24/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case tiempoenvio2 = 0
    case costoenvio2 = 1
}


class VCRestaurantes : UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource , UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var collection: UICollectionView!
    
    var celdaCollection2 : Int = 0
    var resul2 : [Empresa2] = []
    
    var initialdatos2: [Empresa2] = Empresa2.arraydeinformacion2()
    var datos2 : [Empresa2] = Empresa2.arraydeinformacion2()

    
    let empresasfilter : [String] = ["Tiempo", "Costo Envio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        TableView.register(UINib(nibName: "TVCRestaurantes", bundle: nil), forCellReuseIdentifier: "TVCRestaurantes")
       
        collection.register(UINib(nibName: "CVCRestaurantes", bundle: nil), forCellWithReuseIdentifier: "CVCRestaurantes")
        collection.showsHorizontalScrollIndicator = false
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        collection.collectionViewLayout = layout
        
        searchBar.showsScopeBar = false
        searchBar.scopeButtonTitles = empresasfilter
        searchBar.selectedScopeButtonIndex = 0
        
        TableView.delegate = self
        TableView.dataSource = self
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        
    }

    //Confiuración CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datos2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda : CVCRestaurantes = collection.dequeueReusableCell(withReuseIdentifier: "CVCRestaurantes", for: indexPath) as! CVCRestaurantes
        
      celda.lblcelda.text = datos2[indexPath.row].categoria2
        celda.layer.cornerRadius = 10
        return celda
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        celdaCollection2 = indexPath.row
        resul2 = datos2.filter { (Comida) -> Bool in
            if Comida.categoria2 == datos2[indexPath.row].categoria2{
                return true
            }
            else {
                return false
            }
        }
        TableView.reloadData()
    }

func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 5
    layout.minimumInteritemSpacing = 0.1
    let size = CGSize(width: 150, height: collection.frame.size.height)
    layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
    layout.itemSize = size
    
    return layout
    }

//Configuración TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var valor = 0
        
        if searchBar.showsScopeBar == true {
        valor = datos2.count
        }
        
        else  {
        switch(celdaCollection2)
        {
        case 0:
            valor = resul2.count
            break
        case 1:
            valor = resul2.count
            break
        case 2:
            valor = resul2.count
            break
        case 3:
            valor = resul2.count
            break
        default:
            break
         }
    }
     return valor
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCRestaurantes", for: indexPath) as! TVCRestaurantes
        let modelo2 = datos2[indexPath.row]
        
        if searchBar.showsScopeBar == true {
            cell.lblRestaurant.text = modelo2.nombreempresa2
            cell.lblCategoria.text = modelo2.categoria2
            cell.lblTiempodeenvio.text = modelo2.tiempodEnvio2
            cell.lblcostodeenvio.text = modelo2.precioEnvio2
        }
        
        else {
            switch(celdaCollection2)
        {
            
        case 0:
            cell.lblRestaurant.text = resul2[indexPath.row].nombreempresa2
            cell.lblCategoria.text = resul2[indexPath.row].categoria2
            cell.lblTiempodeenvio!.text = resul2 [indexPath.row].tiempodEnvio2
            cell.lblcostodeenvio!.text = resul2[indexPath.row].precioEnvio2

            break
        case 1:
            cell.lblRestaurant.text = resul2[indexPath.row].nombreempresa2
            cell.lblCategoria.text = resul2[indexPath.row].categoria2
            cell.lblTiempodeenvio!.text = resul2[indexPath.row].tiempodEnvio2
            cell.lblcostodeenvio!.text = resul2[indexPath.row].precioEnvio2
            break
            
        case 2:
            cell.lblRestaurant.text = resul2[indexPath.row].nombreempresa2
            cell.lblCategoria.text = resul2[indexPath.row].categoria2
            cell.lblTiempodeenvio!.text = resul2[indexPath.row].tiempodEnvio2
            cell.lblcostodeenvio!.text = resul2[indexPath.row].precioEnvio2
            break
        case 3:
            cell.lblRestaurant.text = resul2[indexPath.row].nombreempresa2
            cell.lblCategoria.text = resul2[indexPath.row].categoria2
            cell.lblTiempodeenvio!.text = resul2[indexPath.row].tiempodEnvio2
            cell.lblcostodeenvio!.text = resul2[indexPath.row].precioEnvio2
                break
            
        default:
            break
            
        }
    }
 
        return cell
    }
 
//Configuracion search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            datos2 = initialdatos2
            TableView.reloadData()
        }else {
            filterTableView (ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
        
func filterTableView(ind:Int,text:String) {
            switch ind {
            case selectedScope.tiempoenvio2.rawValue:
                //fix of not searching when backspacing
                datos2 = initialdatos2.filter({ (mod) -> Bool in
                    return mod.tiempodEnvio2.lowercased().contains(text.lowercased())
                })
                TableView.reloadData()
            case selectedScope.costoenvio2.rawValue:
                //fix of not searching when backspacing
                datos2 = initialdatos2.filter({ (mod) -> Bool in
                    return mod.precioEnvio2.lowercased().contains(text.lowercased())
                })
                
    
            TableView.reloadData()
            default:
                print("no type")
            }
        }
    

    @IBAction func showFilter(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if (sender.isSelected == true){
        searchBar.showsScopeBar = true
        TableView.reloadData()
        }
        else {
        searchBar.showsScopeBar = false
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seguedetalles", sender: nil)
    }
    
   
    
}





