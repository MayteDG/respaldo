//
//  TableViewCell.swift
//  Tableapp
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblRestaurant: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblTiempoEnvio: UILabel!
    @IBOutlet weak var lblCostoEnvio: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
