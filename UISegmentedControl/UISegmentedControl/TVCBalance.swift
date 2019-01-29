//
//  TVCBalance.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 9/28/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class TVCBalance: UITableViewCell {

    @IBOutlet weak var view: UIView!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 10
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
