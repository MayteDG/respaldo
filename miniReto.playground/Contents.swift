//: Playground - noun: a place where people can play

import UIKit

var numeros = 1...100

for cifra in numeros {
    
   
    if cifra%5 == 0 {
        print ("\(cifra), Bingo ")
    } else if cifra%2 == 0 {
        print ("\(cifra),par")
    } else if  cifra%2 == 1 {
        print ("\(cifra),impar")}
    
}
