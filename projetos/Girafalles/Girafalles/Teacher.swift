//
//  Teacher.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import Foundation

class Teacher: User
{
    /* **************************************************************************************************
    **
    **  MARK: Instance variables
    **
    ****************************************************************************************************/
    
    var isOnCall: Bool
    
    let videoURL: String
    
    let address: String
    
    let latitude: Double
    
    let longitude: Double
    
    
    /* **************************************************************************************************
    **
    **  MARK: Instance methods
    **
    ****************************************************************************************************/
    
    /// Default constructor
    init (id: String, facebookID: String, name: String, surname: String, telephone: String, photoURL: String, interestsAndSkill: [String], isOnCall: Bool, videoURL: String, address: String, latitude: Double, longitude: Double)
    {
        self.isOnCall = isOnCall
        self.videoURL = videoURL
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        
        super.init(id: id, facebookID: facebookID, name: name, surname: surname, telephone: telephone, photoURL: photoURL, interestsAndSkill: interestsAndSkill)
    }
}


