//
//  User.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import Foundation

class User
{
    /* **************************************************************************************************
    **
    **  MARK: Instance variables
    **
    ****************************************************************************************************/
    
    let id: String
    
    let facebookID: String
    
    let name: String
    
    let surname: String
    
    let telephone: String
    
    let photoURL: String
    
    let interestsAndSkills: [String]
    
    
    /* **************************************************************************************************
    **
    **  MARK: Instance methods
    **
    ****************************************************************************************************/
    
    /// Default constructor
    init (id: String, facebookID: String, name: String, surname: String, telephone: String, photoURL: String, interestsAndSkill: [String])
    {
        self.id = id
        self.facebookID = facebookID
        self.name = name
        self.surname = surname
        self.telephone = telephone
        self.photoURL = photoURL
        self.interestsAndSkills = interestsAndSkill
    }
}


