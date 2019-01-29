//
//  Configuration.swift
//  singletonExample
//
//  Created by Adrian Pascual Dominguez on 10/25/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit


class configuration {
    
    static let  defaultconfiguration = configuration ()
    var backgroundColor : UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
}

class GlobalVariables {
    // These are the properties you can store in your singleton
    var myName: String = "bob"
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
