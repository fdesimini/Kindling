//
//  RoundedImageView.swift
//  Kindling
//
//  Created by Frank Desimini on 2015-08-25.
//  Copyright (c) 2015 Frank Desimini. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

  
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
        
    }
    
    override func awakeFromNib() {
    print("awake from nib has been called")
   
        layer.cornerRadius = cornerRadius
        cornerRadius = frame.size.width/4
        cornerRadius = frame.size.height/2
        
        clipsToBounds = true
        layer.borderColor = UIColor.grayColor().CGColor
        layer.borderWidth = 8.0
        
        
        
    }
    
}
