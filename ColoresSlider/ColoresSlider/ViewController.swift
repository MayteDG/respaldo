//
//  ViewController.swift
//  ColoresSlider
//
//  Created by Jorge Maldonado Borbón on 12/08/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var red : Float = 0
    var green : Float = 0
    var blue : Float = 0
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valores()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redAction(_ sender: UISlider) {
        red = sender.value
        
        colores(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        
        UserDefaults.standard.set(red, forKey: "red")
        
        
    }
    
    @IBAction func greenAction(_ sender: UISlider) {
        green = sender.value
        //guarda la selecion del color
        colores(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        UserDefaults.standard.set(green, forKey: "green")
    }
    
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blue = sender.value
        //guarda la seleccion del color
        colores(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        UserDefaults.standard.set(blue, forKey: "blue")
    }
    
    func colores(red: CGFloat, green:CGFloat, blue: CGFloat) {
        
        view.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    func valores(){
        
        if let r = UserDefaults.standard.object(forKey: "red") as? CGFloat,
        let g = UserDefaults.standard.object(forKey: "green") as? CGFloat,
        let b = UserDefaults.standard.object(forKey: "blue") as? CGFloat{
            
            colores(red: r, green: g, blue: b)
            
            redSlider.value = Float(r)
            greenSlider.value = Float(g)
            blueSlider.value = Float(b)
            
        }
    }
    
    
    
    
}

