//
//  ViewController.swift
//  tableWithSelection
//
//  Created by Adrian Pascual Dominguez on 10/18/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
   
     var arr = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var table: UITableView!
    

    var position: Int = 0
    var cellcurrent : IndexPath = [0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    table.register(UINib(nibName: "TVC1", bundle: nil), forCellReuseIdentifier: "TVC1")
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        collection.collectionViewLayout = layout
        
    collection.delegate = self
    collection.dataSource = self
    table.delegate = self
    table.dataSource = self
        
    }
  
   
//Configuración Tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = table.dequeueReusableCell(withIdentifier: "TVC1", for : indexPath) as! TVC1
     
        return celda
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return  arr.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
        
    }
    
    //Configuracion CollectionView

 /* func scrollViewDidScroll(_ scrollView: UIScrollView) {
       cellcurrent = self.table.indexPathsForVisibleRows![0]
       self.collection.selectItem(at: [0, cellcurrent.section], animated: false, scrollPosition: .centeredHorizontally)
        
        let cell = collection.cellForItem(at: [0, cellcurrent.section]) as! CollectionViewCell
        cell.lblName.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }*/
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        cellcurrent = self.table.indexPathsForVisibleRows![0]
        self.collection.selectItem(at: [0, cellcurrent.section], animated: false, scrollPosition: .centeredHorizontally)
        
    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        celda.lblName.text = "Seccion \(arr[indexPath.row])"
        return celda
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        position = indexPath.row
        let falseindex = IndexPath(row: 0 , section: indexPath.row )
        self.table.scrollToRow(at: falseindex, at: .top, animated: true)
        
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

}

