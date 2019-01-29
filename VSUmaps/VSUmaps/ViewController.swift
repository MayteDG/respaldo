//
//  ViewController.swift
//  VSUmaps
//
//  Created by Adrian Pascual Dominguez on 07/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lblview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        let distanceSpan : CLLocationDegrees = 2000
        let bsuCSCampuesLocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:19.286147105572876 , longitude:-99.18195409079117)
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(bsuCSCampuesLocation, distanceSpan, distanceSpan), animated: true)
        
        let bsuClassPin = BSuanitation(title: "title", subtitle: "subtitle", coordinate: bsuCSCampuesLocation)
        mapView.addAnnotation(bsuClassPin)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.determineMyCurrentLocation()
    }
   
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        self.enableLocationServices()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
      
        
        let posicionnueva : CLLocationCoordinate2D = CLLocationCoordinate2D (latitude:userLocation.coordinate.latitude , longitude:userLocation.coordinate.longitude )
        
        
        let nuevopunto = BSuanitation(title: "title", subtitle: "subtitle", coordinate: posicionnueva)
        mapView.addAnnotation(nuevopunto)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    
    func enableLocationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
          ///  disableMyLocationBasedFeatures()
            break
            
        case .authorizedWhenInUse:
            // Enable basic location features
           // enableMyWhenInUseFeatures()
               locationManager.startUpdatingLocation()
            break
            
        case .authorizedAlways:
            // Enable any of your app's location features
            //enableMyAlwaysFeatures()
               locationManager.startUpdatingLocation()
            break
        }
    }

    
    @IBAction func fadeinout(_ sender: Any) {
        if lblview.alpha == 0 {
            UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.lblview.alpha = 1.0
            })
            }
        else {
            UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.lblview.alpha = 0.0
            })
        
        }
    

    
    }
    
    
}

