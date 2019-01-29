//: Playground - noun: a place where people can play

import UIKit

func calcularIndiceDeMasaCorporal (pesoIntegral peso : Double, altura : Double ) -> (imcCalculado: Double, mensajeDeSalida: String)
    {
    
    let imc = peso / (altura * altura)
    var mensaje = ""
    if (imc > 18.50 && imc < 25.00){
        mensaje = "peso normal"
            
    }else {
        mensaje = "Debes de acudir con tu médico"
        }
        let resultado = (imc, mensaje)
    return resultado
    
}

let (imc,mensaje) = calcularIndiceDeMasaCorporal(pesoIntegral: 66.0, altura: 1.6)

imc
mensaje

let imcTupla = calcularIndiceDeMasaCorporal(pesoIntegral: 66.0, altura: 1.6)

imcTupla.imcCalculado
imcTupla.mensajeDeSalida


var pelicula : (nombre: String, añoDeSalida: Int , calificacion : Double) = ("El tectigre" , 1990, 100.0)

pelicula.calificacion

