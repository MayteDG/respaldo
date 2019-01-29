//: Playground - noun: a place where people can play

import UIKit

var meses = 1...12

for mes in meses {
    
    switch mes {
        
    case 1, 2, 3:
        print ("Mes templado")
        
    case 4...7:
        print ("Mes calido")
        
    default:
        print ("No se el clima")
    }
    
    
    
    /*
    if mes == 1{
        print ("enero")
    } else if mes == 2 {
        print ("Febrero")
    } else {
        print ("otro mes")
    }
    */
}
