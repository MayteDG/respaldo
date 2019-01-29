//
//  sending.swift
//  ejempDelegatesImages
//
//  Created by Adrian Pascual Dominguez on 27/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
protocol CambiodeColorDelegate
{
    func cambiardecolor (_ color : UIColor)
}

class sending: UIViewController {
    var delegate : CambiodeColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnChangeBlue(_ sender: Any) {
        self.view.backgroundColor = UIColor.blue
        let cambio = view.backgroundColor
        delegate?.cambiardecolor (cambio!)
    }
    
    @IBAction func btnChangeRed(_ sender: Any) {
        self.view.backgroundColor = UIColor.red
    }

}
