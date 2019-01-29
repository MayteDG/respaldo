//
//  ViewController.swift
//  Tableapp
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case Recomendados = 0
    case Tiempo = 1
    case Domicilio = 2
    case Precio = 3
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
 

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var celdaCollection : Int = 0
    var resul : [Empresa] = []

    var inicialdatos : [Empresa] = dataEmpresa.arraydeinformacion()
    var datos : [Empresa] = dataEmpresa.arraydeinformacion ()
    var datoscollection = dataEmpresa?.self
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        searchBar.showsScopeBar = false
        searchBar.scopeButtonTitles = ["Recomendados", "Tiempo", "Domicilio", "Precio"]
        searchBar.selectedScopeButtonIndex = 0
        
   
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        collectionView.collectionViewLayout = layout
        
        
    tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
//Configuracion del collection view
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0.1
        let size = CGSize(width: 150, height: collectionView.frame.size.height)
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = size
        
        return layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        celda.lblCollection.text = datos[indexPath.row].categoria.rawValue
        celda.layer.cornerRadius = 10
        return celda
    }
    
    
    
    
//Configuracion de la Tabla
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    
       
        return cell
    }
    
  //Configuracion UISearchBar
  

    
    
    
    @IBAction func ShowScopeBar(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if (sender.isSelected == true){
            searchBar.showsScopeBar = true
            tableView.reloadData()
        }
        else {
            searchBar.showsScopeBar = false
            
        }
    }
   
    
    
    
}

