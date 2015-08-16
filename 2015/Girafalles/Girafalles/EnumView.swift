//
//  EnumView.swift
//
//  Created by Haroldo Olivieri on 6/9/15.
//  Copyright (c) 2015 Haroldo Olivieri. All rights reserved.
//

import Foundation

enum ColorType {
    
    case DarkBlue
    case Green
    case Yellow
    case White
    case Black
    
    var color : UIColor{
        
        var hexa : UInt
        
        switch (self) {
        case .DarkBlue:
            hexa = 0x353C43
        case .Green:
            hexa = 0x43A9A9
        case .Yellow:
            hexa = 0xFDBC1C
        case .White:
            hexa = 0xFFFFFF
        case .Black:
            hexa = 0x000000
        }
        
        return UIColor.UIColorFromRGB(hexa)
        
    }
}

enum AlertOptions : Int {
    case Cancel
    case Done
}