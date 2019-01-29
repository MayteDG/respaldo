//
//  DataModelo.swift
//  Tableapp
//
//  Created by Adrian Pascual Dominguez on 27/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import Foundation
class dataEmpresa: NSObject {
    
    static func arraydeinformacion() -> [Empresa]{
        var alimentos : [Empresa] = []
        
        let  RebelWings = Empresa(tiempoenvio:"40", costoenvio: "$23.00", restaurante: "RebelWings", categoria: .Destacados, searchBar: "Precio" )
        
        let  Starbucks = Empresa(tiempoenvio:"30", costoenvio: "$30.00", restaurante: "Starbucks", categoria: .Promociones, searchBar: "Domicilio")
        
        let KrispyKream = Empresa(tiempoenvio:"20", costoenvio: "$20.00", restaurante: "KrispyKream", categoria: .Desayunos, searchBar: "Recomendados" )
        
        let  Moyo = Empresa(tiempoenvio:"40", costoenvio: "$25.00", restaurante: "Moyo", categoria: .Promociones, searchBar: "Domicilio" )
        
        let  Mongo = Empresa(tiempoenvio:"20", costoenvio: "$15.00", restaurante: "Mongo", categoria: .Desayunos, searchBar: "Recomendados" )
        
        let  Taco = Empresa(tiempoenvio:"20", costoenvio: "$15.00", restaurante: "Taco Beef", categoria: .Tacos, searchBar: "Precio" )
        
        
        alimentos = [RebelWings, Starbucks, KrispyKream, Moyo, Mongo, Taco]
        
        return alimentos
    }
    
}
