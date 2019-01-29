import UIKit

func factorial (numero : Int)-> Int {
    if numero == 0 {
        return 1
    }
    else {
        return numero * factorial(numero: (numero - 1))
    }
}

func multiplicacion (a: Int, b : Int)-> Int {
    if a == 0 || b == 0{
        return 0
    }
    else if a == 1 {
        return b
    }
    else {
        return b + multiplicacion(a: (a - 1), b: b)
    }
}

multiplicacion(a: 3, b: 4)
factorial(numero: 3)


func TamDeArreglo(arr:NSMutableArray) -> Int{
    print("TamdeArreglo")
    //si mi arreglo es vacio, el tamaño es cero
    if arr.count == 0 {
        print("0")
        return 0
    }else{
        //quito un elemento
        arr.removeObject(at: 0)
        let tama : Int = 1 + TamDeArreglo(arr: arr)
        return tama
    }
}

var arr : NSMutableArray = NSMutableArray()
arr.add(0)
arr.add(100)
arr.add(2342123)

TamDeArreglo(arr: arr)


//var tamaArregloRecursivo = TamDeArreglo(arr: arr)

//print(tamaArregloRecursivo)


func tamRecursivoOpcion(arr:NSMutableArray, result:Int){
    
    if(arr.count == 0){
        print(result)
    }else{
        arr.removeObject(at: 0)
        tamRecursivoOpcion(arr: arr, result: result + 1)
    }

}

tamRecursivoOpcion(arr: arr, result: 0)


func division (n : Int, x: Int) -> Int {
    if (n - x) == 0{
        return 1
    }
    else {
        return (1 + division(n:(n-x), x: x))
    }
}

division(n: 15, x: 5)

