//
//  UserDAO.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import Foundation
import Parse

class UserDAO
{
    // Salva um usuário passado
    // Caso bem suscedido, retorna true, caso contrário retorna false
    class func saveUser (user: User, callback: (Bool) -> ())
    {
        let parseUser = PFObject(className: "User")
        parseUser["facebookID"] = user.facebookID
        parseUser["name"] = user.name
        parseUser["surname"] = user.surname
        parseUser["telephone"] = user.telephone
        parseUser["photoURL"] = user.photoURL
        
        parseUser.saveEventually { succeeded, error -> Void in
            if (succeeded) {
                callback(true)
            } else {
                println("Error - Code: \(error!.code) - Message: \(error!.description)")
                callback(false)
            }
        }
    }
    
    
    // Retorna o usuário de ID fornecido através de uma callback
    class func readUser (id: String, callback: (User?) -> Void)
    {
        var query = PFQuery(className: "User")
        query.getObjectInBackgroundWithId(id) { (parseUser: PFObject?, error: NSError?) in
            if let user = parseUser {
                let id = user.objectId!
                let facebookID = user["facebookID"] as! String
                let name = user["name"] as! String
                let surname = user["surname"] as! String
                let telephone = user["telephone"] as! String
                let photoURL = user["photoURL"] as! String
                let interestsAndSkill = user["interestsAndSkill"] as! [String]
                callback(User(id: id, facebookID: facebookID, name: name, surname: surname, telephone: telephone, photoURL: photoURL, interestsAndSkill: interestsAndSkill))
            } else {
                println("Error - Code: \(error!.code) - Message: \(error!.description)")
                callback(nil)
            }
        }
    }
}


