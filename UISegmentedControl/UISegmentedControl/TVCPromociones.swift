//
//  TVCPromociones.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/8/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCPromociones: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   

    @IBOutlet weak var CVPromociones: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        CVPromociones.register(UINib(nibName: "CVCPromociones", bundle: nil), forCellWithReuseIdentifier: "CVCPromociones")
        CVPromociones.delegate = self
        CVPromociones.dataSource = self
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        CVPromociones.collectionViewLayout = layout
        CVPromociones.isPagingEnabled = true
        CVPromociones.showsHorizontalScrollIndicator = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //Espacio horizontal entre items
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let size = CGSize(width: 300, height: 120)
        layout.sectionInset = UIEdgeInsets (top: 0, left: 0 , bottom: 0, right: 25)
        layout.itemSize = size
        
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CVPromociones.dequeueReusableCell(withReuseIdentifier: "CVCPromociones", for: indexPath) as! CVCPromociones
        
        return cell
    }
    
}
