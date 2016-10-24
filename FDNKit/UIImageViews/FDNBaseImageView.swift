//
//  FDNImageViewBase.swift
//  FDNKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//

import UIKit


@IBDesignable open class FDNBaseImageView: UIImageView {

    
    @IBInspectable open var borderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            if rounded {
                layer.cornerRadius =  bounds.size.width / 2
            }else{
                layer.cornerRadius = 0
            }
            clipsToBounds = true
        }
    }
    
    // MARK: - Initializers
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    open override func layoutSubviews() {
        
    }
    
    open func customInit() {        
        
    }
    
    
}
