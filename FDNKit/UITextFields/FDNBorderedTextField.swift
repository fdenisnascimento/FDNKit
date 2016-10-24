//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// Text field with the ability to set a border with a corner.
@IBDesignable open class FDNBorderedTextField: FDNBaseTextField {

    /// Border color for Normal state.
    @IBInspectable open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /// The control's border width. Gets automatically scaled with using UIScreen.main.scale.
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }


    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Build text field

    override open func customInit() {
        super.customInit()

        borderStyle = UITextBorderStyle.none
        cornerRadius = 6.0
        borderWidth = 1.0

        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        if clearButtonMode == .always {
            // rightPadding adds more space for Clear button.
            return textRect(bounds, rightPadding: clearButtonRect(forBounds: bounds).width)
        } else {
            return textRect(bounds)
        }
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        if clearButtonMode == .never || clearButtonMode == .unlessEditing {
            return textRect(bounds)
        } else {
            return textRect(bounds, rightPadding: clearButtonRect(forBounds: bounds).width)
        }
    }

    // MARK: - Misc

    private func textRect(_ bounds: CGRect, rightPadding: CGFloat = 0) -> CGRect {
        var editingRect = bounds.insetBy(dx: cornerRadius, dy: 0)
        editingRect.size = CGSize(width: editingRect.width - rightPadding, height: editingRect.height)
        return editingRect
    }


}
