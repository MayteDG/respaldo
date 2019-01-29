//
//  TVCServicios.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 9/28/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCServicios: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionview: UICollectionView!
    var datos : [Empresa] = Empresa.arraydeinformacion()
    var delegate : servicioSelectionDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionview.register(UINib(nibName: "CVCServicios1", bundle: nil), forCellWithReuseIdentifier: "CVCServicios1")
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        collectionview.collectionViewLayout = layout
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        let size = CGSize(width: 160, height: 110)
        layout.sectionInset = UIEdgeInsets (top: 0, left: 0 , bottom: 0, right: 0)
        layout.itemSize = size
        
        return layout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
       let cell : CVCServicios1 = collectionview.dequeueReusableCell(withReuseIdentifier: "CVCServicios1", for: indexPath) as! CVCServicios1
        
        cell.lblnombreServicios.text = datos[indexPath.row].nombreempresa
        
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentselection = indexPath.row
        let empresaselec = datos[currentselection]
        delegate?.Clickselection(selection: empresaselec)
    }
    
}
