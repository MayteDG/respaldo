//
//  test.swift
//  test
//
//  Created by Adrian Pascual Dominguez on 05/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class test: NSObject {

    var texto : String
    var imagen : UIImage
    
    override init() {
        texto = ""
        imagen = UIImage ()
    }
    
    init( texto : String , image : UIImage) {
        self.texto = texto
        self.imagen = UIImage ()
    }
    
    
    static func regresacosas () -> test{
       
        let  cosas = test ()
        cosas.imagen = UIImage (named: "algo" )!
        cosas.texto = "Algo mas"
        
        return cosas
    }
    

    
    
    
    
    
}

