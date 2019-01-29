//
//  producto.swift
//  productosCell
//
//  Created by Adrian Pascual Dominguez on 28/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class producto: NSObject {
    var descripcion : String
    var precio : String
    
    override init() {
        descripcion = ""
        precio = ""
    }
    
    init(descripcion : String , precio : String) {
        self.descripcion = descripcion
        self.precio = precio
    }
    
    static func productosParaLista() -> [producto] {
        var ProductosparaTabla : [producto] = []
        ProductosparaTabla.append(producto(descripcion: "Tevision $K UHD" , precio: "$12,000"))
        ProductosparaTabla.append(producto(descripcion: "Bocinas", precio: "$1,234"))
        ProductosparaTabla.append(producto(descripcion: "Libretas", precio: "$5,000"))
        
        return ProductosparaTabla
    }
}
