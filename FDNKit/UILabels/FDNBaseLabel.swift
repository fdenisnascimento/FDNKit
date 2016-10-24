//
//  BaseLabel.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// Base label class.
@IBDesignable open class FDNBaseLabel: UILabel {
    
   
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

    // MARK: - Build control

    /// Overriden method must call super.customInit().
    open func customInit() {
        configureFont()
        configureColor()

    }

    /// Configures control's font.
    open func configureFont() {
    }

    /// Configures control's label.
    open func configureColor() {
    }

    
}
