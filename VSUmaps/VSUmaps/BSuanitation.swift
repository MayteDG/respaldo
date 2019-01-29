//
//  BSuanitation.swift
//  VSUmaps
//
//  Created by Adrian Pascual Dominguez on 07/08/18.
//  Copyright © 2018 Adrian Pascual Dominguez. All rights reserved.
//

import MapKit

class BSuanitation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle : String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }

    
}

