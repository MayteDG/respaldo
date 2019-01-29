//
//  TVC1.swift
//  tableWithSelection
//
//  Created by Adrian Pascual Dominguez on 10/18/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVC1: UITableViewCell {

    
    @IBOutlet weak var lblNombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
