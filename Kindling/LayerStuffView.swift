//
//  LayerStuffView.swift
//  Kindling
//
//  Created by Frank Desimini on 2015-08-25.
//  Copyright (c) 2015 Frank Desimini. All rights reserved.
//

import UIKit

class LayerStuffView: UIView {

 
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
        
    }
    
    override func awakeFromNib() {
//        print("")
//        layer.cornerRadius = cornerRadius
//        layer.borderColor = UIColor.grayColor().CGColor
//        layer.borderWidth = 8.0
        
    }
    
    
    
}
