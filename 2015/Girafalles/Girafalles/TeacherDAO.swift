//
//  TeacherDAO.swift
//  Girafalles
//
//  Created by Renan Almeida on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import Foundation
import Parse

class TeacherDAO
{
    class func searchTeachersNearLatitude (latitude: Double, longitude: Double, callback: ([Teacher]) -> Void)
    {
        let geoPoint = PFGeoPoint(latitude: latitude, longitude: longitude)
        var query = PFQuery(className: "User")
       query.whereKey("isTeacher", equalTo: true)
        query.whereKey("geoPoint", nearGeoPoint: geoPoint)
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            var teacherList = [Teacher]()
            if (error == nil) {
                for (var i = 0 ; i < objects?.count ; i++) {
                    let parseTeacher = objects![i] as! PFObject
                    let geoPoint = parseTeacher["geoPoint"] as! PFGeoPoint
                    teacherList.append(Teacher(
                        id: parseTeacher.objectId!,
                        facebookID: parseTeacher["facebookID"] as! String,
                        name: parseTeacher["name"] as! String,
                        surname: parseTeacher["surname"] as! String,
                        telephone: parseTeacher["telephone"] as! String,
                        photoURL: parseTeacher["photoURL"] as! String,
                        interestsAndSkill: parseTeacher["interestsAndSkill"] as! [String],
                        isOnCall: parseTeacher["isOnCall"] as! Bool,
                        videoURL: parseTeacher["videoURL"] as! String,
                        address: parseTeacher["address"] as! String,
                        latitude: geoPoint.latitude,
                        longitude: geoPoint.longitude
                    ))
                }
            } else {
                println("Error - Code: \(error!.code) - Message: \(error!.description)")
            }
            callback(teacherList)
        }
    }
}
