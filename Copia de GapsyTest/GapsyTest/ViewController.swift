//
//  ViewController.swift
//  GapsyTest
//
//  Created by Adrian Pascual Dominguez on 10/1/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet var tabGesture: UIView!
    var tapgesture = UITapGestureRecognizer()
    
    @IBOutlet weak var tableviewopciones: UITableView!
    @IBOutlet weak var tableviewmain: UITableView!
    @IBOutlet weak var txtNameProducto: UITextField!
    
    var txtabuscar : String = "xbox"
    
    var busquedas : [String] = []
    var forKey = "saveArray"

    var SaveArrUserDefault : [String] = []
    var NewArr : [String] = []
    
    var arrDatos : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableviewopciones.delegate = self
        tableviewopciones.dataSource = self
        tableviewopciones.register(UINib(nibName: "TVCOpciones", bundle: nil), forCellReuseIdentifier: "TVCOpciones")
        tableviewopciones.isHidden = true
        
        tableviewmain.dataSource = self
        tableviewmain.delegate = self
        tableviewmain.register(UINib(nibName: "TVCData", bundle: nil), forCellReuseIdentifier: "TVCData")
        
         obtendatos()
        
        // TAP Gesture
    /*     tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped(_:)))
        tapgesture.numberOfTapsRequired = 1
        tapgesture.numberOfTouchesRequired = 1
        tabGesture.addGestureRecognizer(tapgesture)
        tabGesture.isUserInteractionEnabled = true*/
    
    }
    
  /* @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
         tableviewopciones.isHidden = true
        }
*/
    
        func obtendatos(){
    
            let urlString : String = "https://www.liverpool.com.mx/tienda?s=\(txtabuscar)&d3106047a194921c01969dfdec083925=json"
            let url = URL(string: urlString)
            URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
                guard let data = data, error == nil else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
                    self.parseDicctionary(dic: json)
                } catch let error as NSError {
                    print(error)
                }
            }).resume()
    }
    
    func agregaProducto(productofinal: NSDictionary){
        let producto: NSDictionary = productofinal as! NSDictionary
        let detalles : NSDictionary = producto.object(forKey: "attributes") as! NSDictionary
        
        let nombDet : NSArray = detalles.object(forKey: "product.displayName") as! NSArray
        let precDet : NSArray = detalles.object(forKey: "sku.sale_Price") as! NSArray
        let imgDet  : NSArray = detalles.object(forKey: "sku.thumbnailImage") as! NSArray
        
       
        let prod = Caracteristicas ()
        
        prod.nombre = nombDet.object(at: 0) as! String
        prod.precio = precDet.object(at: 0) as! String
        prod.imgProduct = imgDet.object(at: 0) as! String
        arrDatos.add(prod)
    }
    
    
    func cargaImagenFromUrl(uiImage: UIImageView, UrlImage : String){
        
        let url = URL(string: UrlImage)
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(Data,_ , err) in
            
            if err != nil {
                print("Error al obtener los datos de la imagen: " + err.debugDescription)
                return
            }
            
            DispatchQueue.main.async {
                uiImage.image = UIImage(data: Data!)!
            }
            
        }).resume()
        
    }
    
    

    func parseDicctionary(dic: NSDictionary){
        arrDatos.removeAllObjects()
        
        guard let arrContent2  = dic.object(forKey: "contents") else{
            return
        }
        
       let  arrContent : NSArray = dic.object(forKey: "contents") as! NSArray
        
        let dicContent: NSDictionary = arrContent.object(at: 0) as! NSDictionary
        let arrMainContent : NSArray = dicContent.object(forKey: "mainContent") as! NSArray
        var dicContent2: NSArray = NSArray()
        
        for dic  in arrMainContent{
            if let contents = (dic as! NSDictionary).object(forKey: "contents") {
                if (contents as! NSArray).count > 0 {
                    
                    for dicItemContent in (contents as! NSArray){
                     
                        if let record = (dicItemContent as! NSDictionary).object(forKey: "records"){
                            for productofinal in (record as! NSArray) {
                                self.agregaProducto(productofinal: productofinal as! NSDictionary)
                            }
                            break
                        }
                    }
                    
                    
                }
                
            }
        }

        DispatchQueue.main.async {
            self.tableviewmain.reloadData()
        }
    }

    
    //Configuracion Tablas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableviewopciones {
            return busquedas.count
        }
        else{
        return  arrDatos.count
        }
        
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableviewopciones {
            let celda = tableviewopciones.dequeueReusableCell(withIdentifier:"TVCOpciones") as! TVCOpciones
            celda.lblopciones.text = busquedas[indexPath.row]
            
            return celda
        }
        else {
    let celda = tableviewmain.dequeueReusableCell(withIdentifier: "TVCData") as! TVCData
        
        let articulo:Caracteristicas = arrDatos.object(at: indexPath.row) as! Caracteristicas
     
            celda.Titulo.text = articulo.nombre
            celda.lblPrecio.text = articulo.precio
        cargaImagenFromUrl(uiImage: celda.img , UrlImage: (articulo.imgProduct))

         return celda
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableviewmain {
        return 150
        }
        else {
            return 40
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableviewopciones {
            var currentcell = indexPath.row
            txtNameProducto.text = busquedas[currentcell]
            tableviewopciones.isHidden = true
        }
        
    }
    
    @IBAction func btnSearch(_ sender: Any) {

        if self.txtNameProducto.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Por favor introduce un texto para iniciar la busqueda", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            txtabuscar =  txtNameProducto.text ?? ""
            self.obtendatos()
            busquedas.append(txtabuscar)
            UserDefaults.standard.set(busquedas, forKey: forKey)
            tableviewopciones.isHidden = true
        }
    }
    
    
    @IBAction func show(_ sender: Any) {
        tableviewopciones.isHidden = false
        tableviewmain.reloadData()
        
        busquedas = UserDefaults.standard.stringArray(forKey: forKey) ?? [String]()
        tableviewopciones.reloadData()
    }
    
    
    
}
