//
//  Modelo.swift
//  Tableapp
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import Foundation
class Empresa: NSObject {
    var tiempoenvio: String
    var costoenvio: String
    var restaurante : String
    var categoria : Categorias
    var searchBar : String
    
    
    enum Categorias: String {
        case Desayunos
        case Destacados
        case Promociones
        case Tacos
        case All
    }
    
    
    init (tiempoenvio : String, costoenvio : String , restaurante : String, categoria : Categorias, searchBar : String) {
        self.tiempoenvio = tiempoenvio
        self.costoenvio = costoenvio
        self.restaurante = restaurante
        self.categoria = categoria
        self.searchBar = searchBar
        
        
        super.init()
    }
}



