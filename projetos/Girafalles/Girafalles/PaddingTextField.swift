//
//  PaddingTextField.swift
//  MFit
//
//  Created by Haroldo Olivieri on 7/29/15.
//  Copyright (c) 2015 Coutinho, Filipo, Haroldo, João. All rights reserved.
//

import UIKit
//import MaterialKit

class PaddingTextField: UITextField {
    var leftTextMargin : CGFloat = 30.0
    var topTextMargin : CGFloat = 8.0
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
//        newBounds.origin.y += topTextMargin
        return newBounds
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
//        newBounds.origin.y += topTextMargin
        return newBounds
    }
}
