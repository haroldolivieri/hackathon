//
//  CDRegisterView.swift
//  Girafalles
//
//  Created by Haroldo Olivieri on 8/15/15.
//  Copyright (c) 2015 [carioca.build]. All rights reserved.
//

import UIKit
import AMTagListView

class CBTagRegisterView : UIView {
    
    var tagTextField : PaddingTextField!
    var tagList : AMTagListView!
    
    init(parentView : UIView){
        super.init(frame: parentView.frame)

        var width = UIScreen.mainScreen().bounds.size.width
        var height = parentView.bounds.size.height
    
//        tagTextField = PaddingTextField(frame: CGRectMake(0, 0, width*0.8, parentView.frame.height*0.2))
//        tagTextField.backgroundColor = UIColor.whiteColor()
//        tagTextField.layer.cornerRadius = 5
//        tagTextField.placeholder = "Entre com seus interesses"
//        tagTextField.center.y = height*0.17
//        tagTextField.center.x = width*0.5
        
        tagList = AMTagListView(frame: CGRectMake(0, 0, width*0.9, parentView.frame.height*0.65))
        tagList.contentInset = UIEdgeInsetsMake(10,10,10,10)
        tagList.backgroundColor = ColorType.White.color
        tagList.layer.cornerRadius = 5
        tagList.center.x = width*0.5
        tagList.center.y = height*0.55
        
        AMTagView.appearance().tagLength = 10
        AMTagView.appearance().textPadding = 14
        AMTagView.appearance().textFont = UIFont(name: "Avenir", size: 14)
        AMTagView.appearance().tagColor = ColorType.Green.color
        
//        parentView.addSubview(tagTextField)
        parentView.addSubview(tagList)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
