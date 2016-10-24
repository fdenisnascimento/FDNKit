//
//  DCRoundedButton.swift
//  DCKitSample
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// A bordered button with rounded corners.
@IBDesignable open class FDNRoundedButton: FDNBorderedButton {

    /// cornerRadius doesn't work for this control. It's strictly set to frame.size.height*0.5
    override open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
        }
    }

    // MARK: - Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Life cycle

    open override func layoutSubviews() {
        super.layoutSubviews()

        setCornerRadius()
    }

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        addBorder()
    }

    override open func addBorder() {
        layer.borderColor = normalBorderColor.cgColor
        layer.borderWidth = 1.0 / UIScreen.main.scale
        setCornerRadius()
        clipsToBounds = true

        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    private func setCornerRadius() {
        layer.cornerRadius = frame.size.height*0.5
    }

    // MARK: - Misc

    override open func updateColor() {
        super.updateColor()
        layer.borderColor = isEnabled ? (isSelected ? selectedBorderColor.cgColor : normalBorderColor.cgColor) : disabledBorderColor.cgColor
    }

}
