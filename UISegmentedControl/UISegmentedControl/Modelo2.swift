//
//  Modelo2.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/9/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//


import Foundation

class Empresa2: NSObject {
    var tiempodEnvio2: String
    var precioEnvio2: String
    var nombreempresa2 : String
    var categoria2 : String
    var precio2 : Int
  
    override init() {
        tiempodEnvio2 =  ""
        precioEnvio2 =  ""
        nombreempresa2 =  " "
        categoria2 = ""
        precio2 = 0
    }
    
    init (tiempodEnvio2 : String, precioEnvio2 : String , nombreempresa2 : String, categoria2 : String, precio2: Int)
    {
        self.tiempodEnvio2 = tiempodEnvio2
        self.precioEnvio2 = precioEnvio2
        self.nombreempresa2 = nombreempresa2
        self.categoria2 = categoria2
        self.precio2 = precio2
        
    }
    
    static func arraydeinformacion2() -> [Empresa2]{
        var lista : [Empresa2] = []
        
        let sushito = Empresa2()
        sushito.nombreempresa2 = "Sushito"
        sushito.tiempodEnvio2 = "20"
        sushito.precioEnvio2 = "$1,500.00"
        sushito.categoria2 = "Internacionales"
        sushito.precio2 = 30
        
        let tacoExpress = Empresa2()
        tacoExpress.nombreempresa2 = "Express"
        tacoExpress.tiempodEnvio2 = "10"
        tacoExpress.precioEnvio2 = "$65.00"
        tacoExpress.categoria2 = "Destacados"
        tacoExpress.precio2 = 20
        
        let mexicana = Empresa2()
        mexicana.nombreempresa2 = "CocinaMexicana"
        mexicana.tiempodEnvio2 = "25"
        mexicana.precioEnvio2 = "$75.00"
        mexicana.categoria2 = "Restaurante"
        mexicana.precio2 = 20
        
        let elotes = Empresa2()
        elotes.nombreempresa2 = "Elotes"
        elotes.tiempodEnvio2 = "40"
        elotes.precioEnvio2 = "$20.00"
        elotes.categoria2 = "Desayunos"
        elotes.precio2 = 5
    
        lista = [sushito,tacoExpress,mexicana,elotes]
        
        return lista
    }
    
}

