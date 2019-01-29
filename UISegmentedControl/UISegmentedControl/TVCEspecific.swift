//
//  TVCEspecific.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/23/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCEspecific: UITableViewCell {

    
    @IBOutlet weak var btnAgregar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAgregar.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        btnAgregar.layer.borderWidth = 1
        btnAgregar.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
