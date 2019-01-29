//
//  VCDetails.swift
//  UISegmentedControl
//
//  Created by Adrian Pascual Dominguez on 10/9/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit

class VCDetails: UIViewController, UITableViewDelegate , UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagenStore: UIImageView!
    @IBOutlet weak var viewDetails: UIView!
    var panGesture  = UIPanGestureRecognizer()
    @IBOutlet var firtsview: UIView!
    @IBOutlet weak var TVDetails: UITableView!
    @IBOutlet weak var CVDetails: UICollectionView!
    
    
    
    @IBOutlet weak var ViewCanasta: UIView!
    var tapGesture = UITapGestureRecognizer()
    
    
    let direction: [UISwipeGestureRecognizer.Direction] = [.up, .down]
   
    var arr = ["1","2","3","4","5","6","7","8","9"]
    var position: Int = 0
    var cellcurrent : IndexPath = [0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        TVDetails.register(UINib(nibName: "TVCEspecific", bundle: nil), forCellReuseIdentifier: "TVCEspecific")
        TVDetails.delegate = self
        TVDetails.dataSource = self
        
        CVDetails.register(UINib(nibName: "CVCTitleSection", bundle: nil), forCellWithReuseIdentifier: "CVCTitleSection")
        CVDetails.showsHorizontalScrollIndicator = false
        let layout = self.regresaConfiguraciondeELEmentosdelCollection()
        CVDetails.collectionViewLayout = layout
        
        imagenRedonda()
        tapgesture()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        for dir in direction {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeView(_:)))
            firtsview.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = dir
           firtsview.isUserInteractionEnabled = true
           firtsview.isMultipleTouchEnabled = true
        }
    
}
    
    func tapgesture (){
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(VCDetails.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        ViewCanasta.addGestureRecognizer(tapGesture)
        ViewCanasta.isUserInteractionEnabled = true
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "canasta", sender: nil)
    }
    
    func imagenRedonda (){
        imagenStore.layer.borderWidth = 1
        imagenStore.layer.masksToBounds = false
        imagenStore.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imagenStore.layer.cornerRadius = imagenStore.frame.height/2
        imagenStore.clipsToBounds = true
    }
    
    // Gesture recognizer
    @objc func swipeView(_ sender:UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .up {
                self.viewDetails.frame = CGRect(x: self.view.frame.size.width - self.viewDetails.frame.size.width, y: self.view.frame.size.height - 580, width: self.viewDetails.frame.size.width, height: self.viewDetails.frame.size.height)
                //imagen
                self.image.frame = CGRect (x: 0 , y: -20, width: 375, height: 144)
               //collection
            }else {
                self.viewDetails.frame = CGRect(x: self.view.frame.size.width - self.viewDetails.frame.size.width, y: self.viewDetails.frame.size.height + 90 , width: self.viewDetails.frame.size.width, height: self.viewDetails.frame.size.height)
                //Image
                self.image.frame = CGRect (x: 0 , y: 20, width: 375, height: 144)
                //collection
            }
        }
    }
    
    //Configuración Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TVDetails.dequeueReusableCell(withIdentifier: "TVCEspecific", for: indexPath) as! TVCEspecific
       cell.selectionStyle = .none
        return cell}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   performSegue(withIdentifier: "comprar", sender: nil )
    }
    
  
//Configuracion Collection
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        cellcurrent = self.TVDetails.indexPathsForVisibleRows![0]
        self.CVDetails.selectItem(at: [0, cellcurrent.section], animated: false, scrollPosition: .centeredHorizontally)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CVDetails.dequeueReusableCell(withReuseIdentifier: "CVCTitleSection", for: indexPath) as! CVCTitleSection
        cell.lblNameTitles.text = "Seccion \(arr[indexPath.row])"

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        position = indexPath.row
        let falseindex = IndexPath(row: 0 , section: indexPath.row )
        self.TVDetails.scrollToRow(at: falseindex, at: .top, animated: true)
        
    }
    
    func regresaConfiguraciondeELEmentosdelCollection()-> UICollectionViewLayout{
        CVDetails.dataSource = self
        CVDetails.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0.1
        let size = CGSize(width: 70, height: CVDetails.frame.size.height)
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = size
        
        return layout
    }

    
}
