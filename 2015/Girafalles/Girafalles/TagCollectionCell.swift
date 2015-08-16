//
//  SubjectsCell.swift
//  EduOrganizer
//
//  Created by Haroldo Olivieri on 3/23/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import AMTagListView

class TagCollectionCell : UICollectionViewCell{
    
    var tagView : AMTagView!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        tagView = AMTagView(frame: CGRectZero)
        tagView.tagLength = 10
        tagView.textPadding = 14
        tagView.textFont = UIFont(name: "Avenir", size: 14)
        tagView.tagColor = ColorType.Green.color
        
        addSubview(tagView);
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}