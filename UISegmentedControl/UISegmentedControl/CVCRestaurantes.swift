//
//  CVCRestaurantes.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 25/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class CVCRestaurantes: UICollectionViewCell {

    
    
    @IBOutlet weak var lblcelda: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor.yellow : UIColor.clear
        }
    }
    
    

}
