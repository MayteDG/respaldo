//
//  TVCAllOptions.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/8/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCAllOptions: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var datos : [Empresa] = Empresa.arraydeinformacion()
    @IBOutlet weak var CVAllOptions: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CVAllOptions.register(UINib(nibName: "CVCAllOptions", bundle: nil), forCellWithReuseIdentifier: "CVCAllOptions")
        
        CVAllOptions.delegate = self
        CVAllOptions.dataSource = self
        
    let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        CVAllOptions.collectionViewLayout = layout
        self.CVAllOptions.isPagingEnabled = true
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //Espacio horizontal entre items
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        let size = CGSize(width: 65, height: 60)
        layout.sectionInset = UIEdgeInsets (top: 10, left: 0 , bottom: 2, right: 25)
        layout.itemSize = size
    
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return datos.count
        }
        else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CVAllOptions.dequeueReusableCell(withReuseIdentifier: "CVCAllOptions", for: indexPath) as! CVCAllOptions
        cell.lblNameService.text = datos[indexPath.row].nombreempresa
        return cell
    }
    
}
