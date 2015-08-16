//
//  CustomAnnotation.swift
//  Girafalles
//
//  Created by Lucas Lima on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import MapKit


class teacherAnnotation: NSObject, MKAnnotation {
    let title: String
    let teacherRating: String
    let id: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, teacherRating: String, id: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.teacherRating = teacherRating
        self.id = id
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String {
        return teacherRating
    }
}