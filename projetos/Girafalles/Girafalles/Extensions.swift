//
//  Extensions.swift
//
//  Created by Haroldo Olivieri on 5/20/15.
//  Copyright (c) 2015 Haroldo Olivieri. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

extension UIImage {
    
    class func identiconWithString(string: String, size: CGFloat) -> UIImage {
        let number = string.hashValue
        let image = identiconWithNumber(number, size: size, backgroundColor: UIColor.whiteColor())
        return image
    }
    
    class func identiconWithNumber(number: Int, size: CGFloat, backgroundColor: UIColor) -> UIImage {
        
        if size == 0.0 {
            return UIImage()
        }
        
        let blue = (number >> 16) & 31
        let green = (number >> 21) & 31
        let red = (number >> 27) & 31
        let foregroundColor = UIColor(red: (CGFloat)(red * 8) / 255.0, green: (CGFloat)(green * 8) / 255.0, blue: (CGFloat)(blue * 8) / 255.0, alpha: 1.0)
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetShouldAntialias(context, false)
        backgroundColor.setFill()
        CGContextFillRect(context, CGRectMake(0.0, 0.0, size, size))
        
        foregroundColor.setFill()
        let cellSize = size / 5.0
        for var i = 0; i < 15; ++i {
            if (((number >> i) & 0x1) == 1) {
                let drawPositionX = i % 3
                let drawPositionY = i / 3
                CGContextFillRect(context, CGRectMake(CGFloat(drawPositionX) * cellSize, CGFloat(drawPositionY) * cellSize, cellSize, cellSize))
                if (drawPositionX != 4 - drawPositionX) {
                    CGContextFillRect(context, CGRectMake(CGFloat((4 - drawPositionX)) * cellSize, CGFloat(drawPositionY) * cellSize, cellSize, cellSize))
                }
            }
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // convert UIImage into base64 and keep them into string
    class func convertImageToBase64(image: UIImage) -> String {
        
        if let imageData = UIImageJPEGRepresentation(image, 0.2) {
            let base64String = imageData.base64EncodedStringWithOptions(.allZeros)
            return base64String
        }else{
            return ""
        }
    }
    
    // convert base64 into UIImage
    class func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0) )
        
        var decodedimage = UIImage(data: decodedData!)
        
        return decodedimage!
        
    }
}

extension NSData{
    
    // convert files into base64 and keep them into string
    class func convertFiletoBase64(path : String) -> String{
        let fileData : NSData = NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)!
        
        return fileData.base64EncodedStringWithOptions(.allZeros)
    }
    
    // convert base64 to a file path with the data storaged
    class func convertBase64ToFilePath(base64String : String) -> String{
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
        
        var videoFile : NSData = NSData(data: decodedData!);
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! NSString
        
        var path : String = (documentsPath as String) + "/myMovie.mov";
        videoFile.writeToFile(path, atomically: true);
        
        return path;
    }
}