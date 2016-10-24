//
//  CircleView.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// A circle UIView.
/// - note: Make sure the view is a square on storyboard.
@IBDesignable open class FDNCircleView: FDNBorderedView {

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

        updateLayerSettings()
    }

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        updateLayerSettings()
    }

    /// Makes the view circle.
    private func updateLayerSettings() {
        layer.cornerRadius = frame.size.height*0.5
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

}
