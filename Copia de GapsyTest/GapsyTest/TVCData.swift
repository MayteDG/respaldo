//
//  TVCData.swift
//  GapsyTest
//
//  Created by Adrian Pascual Dominguez on 10/1/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCData: UITableViewCell {

    
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Titulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
