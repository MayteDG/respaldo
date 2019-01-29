//
//  Model.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 26/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import Foundation


class Servicios {
    var nombreServicios : String
    var inforServicios : [Empresa]
    
    
    init (){
        nombreServicios = ""
        inforServicios = [Empresa] ()
    }
 
    
}


class Empresa: NSObject {
    var tiempodEnvio: String
    var precioEnvio: String
    var nombreempresa : String
    var categoria : String
    var arrayservicios : [Empresa]

    
    override init() {
        tiempodEnvio =  ""
        precioEnvio =  ""
        nombreempresa =  " "
        categoria = ""
        arrayservicios = [Empresa]()
        
     
    }
    
    init (tiempodEnvio : String, precioEnvio : String , nombreempresa : String, categoria : String)
    {
        self.tiempodEnvio = tiempodEnvio
        self.precioEnvio = precioEnvio
        self.nombreempresa = nombreempresa
        self.categoria = categoria
        self.arrayservicios = [Empresa]()
        
    }

    
    
static func arraydeinformacion() -> [Empresa]{
    var lista : [Empresa] = []
    
    let mercado = Empresa()
    mercado.nombreempresa = "SUPER"
    mercado.categoria = "Internacionales"
    let restaurant = Empresa()
    restaurant.nombreempresa = "RESTAURANTES"
    restaurant.tiempodEnvio = "25"
    restaurant.categoria = "Internacionales"
    let licores = Empresa()
    licores.nombreempresa = "licores"
    licores.categoria = "Destacados"
    let cinemex = Empresa()
    cinemex.nombreempresa = "cinemex"
    cinemex.categoria = "Restaurante"
    let farmacia = Empresa()
    farmacia.nombreempresa = "Farmacia"
    farmacia.categoria = "Desayunos"
    let RappiFavor = Empresa ()
    RappiFavor.nombreempresa = "RappiFavor"
    RappiFavor.categoria = "Desayunos"
    let RappiCash = Empresa()
    RappiCash.nombreempresa = "RappiCash"
    RappiCash.categoria = "Desayunos"
    let pets = Empresa()
    pets.nombreempresa = "pets"
    pets.categoria = "Internacionales"
    let cats = Empresa ()
    cats.nombreempresa = "cats"
    cats.categoria = "Desayunos"
    
    let sushito = Empresa()
    sushito.nombreempresa = "Sushito"
    sushito.tiempodEnvio = "20"
    sushito.precioEnvio = "$1,500.00"
    sushito.categoria = "Internacionales"

    let tacoExpress = Empresa()
    tacoExpress.nombreempresa = "Express"
    tacoExpress.tiempodEnvio = "10"
    tacoExpress.precioEnvio = "$65.00"
    tacoExpress.categoria = "Destacados"
    
    let mexicana = Empresa()
    mexicana.nombreempresa = "CocinaMexicana"
    mexicana.tiempodEnvio = "25"
    mexicana.precioEnvio = "$75.00"
    mexicana.categoria = "Restaurante"
    
    let elotes = Empresa()
    elotes.nombreempresa = "Elotes"
    elotes.tiempodEnvio = "40"
    elotes.precioEnvio = "$20.00"
    elotes.categoria = "Desayunos"
    
    restaurant.arrayservicios.append(sushito)
    restaurant.arrayservicios.append(tacoExpress)
    restaurant.arrayservicios.append(mexicana)
    restaurant.arrayservicios.append(elotes)
    
    lista = [mercado, restaurant, licores, cinemex ,farmacia,RappiFavor,RappiCash, pets,cats]
    
    return lista
    }
    
}


