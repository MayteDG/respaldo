//
//  ViewCell.swift
//  productosCell
//
//  Created by Adrian Pascual Dominguez on 28/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewCell: UITableViewCell {

    @IBOutlet weak var lbldesc: UILabel!
    @IBOutlet weak var lblprecio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
