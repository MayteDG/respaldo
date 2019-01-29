//
//  ViewController.swift
//  URLSessionJSONRequests
//
//  Created by Adrian Pascual Dominguez on 21/09/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BtnGetOption(_ sender: Any) {
        guard let url = URL (string: "https://jsonplaceholder.typicode.com/users")
            else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data,response, error) in
            if let response = response {
                print (response)
            }
            if let data = data {
                print(data)
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    @IBAction func BtnPostOption(_ sender: Any) {
        
        let parameters = ["username":"@algun_usuario","Tweet":"HeloWorld"]
        
        guard let url = URL (string: "https://jsonplaceholder.typicode.com/posts")
            else {return}
        var request = URLRequest (url: url )
        request.httpMethod = "POST"
        
//Especificar que se esta enviando un JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
//Convertir la información "parameters" en un jason
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters , options: []) else {return }
        request.httpBody =  httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print (response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch{
                    print(error)
                }
            }
        }.resume()
    }
}

