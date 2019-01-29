//
//  CollectionViewCell.swift
//  Tableapp
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var lblCollection: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        lblCollection.layer.cornerRadius = 5
        // Initialization code
    }

}
