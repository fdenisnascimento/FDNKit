//
//  BorderedButton.swift
//  Socium
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// Button class with the ability to set a border with a corner.
@IBDesignable open class FDNBorderedButton: FDNBaseButton {

    override open var isEnabled: Bool {
        didSet {
            updateColor()
        }
    }

    /// Border color for Normal state.
    @IBInspectable open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            updateColor()
        }
    }

    /// Border color for Disabled state.
    @IBInspectable open var disabledBorderColor: UIColor = UIColor.lightGray {
        didSet {
            updateColor()
        }
    }

    /// Border color for Selected state.
    @IBInspectable open var selectedBorderColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    /// The control's border width. Gets automatically scaled with using UIScreen.main.scale.
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }

    // MARK: - Initializers


    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        addBorder()
    }

    /// Adds a border to the button.
    open func addBorder() {
        layer.borderColor = normalBorderColor.cgColor
        borderWidth = 1.0

        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    // MARK: - Misc

    override open func updateColor() {
        super.updateColor()

        layer.borderColor = isEnabled ? (isSelected ? selectedBorderColor.cgColor : normalBorderColor.cgColor) : disabledBorderColor.cgColor
    }

}
