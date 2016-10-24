//
//  DCBaseView.swift
//  DCKitSample
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// A bse view class.
open class FDNBaseView: UIView {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        customInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        customInit()
    }

    // MARK: - Build control

    /// Overriden method must call super.customInit().
    open func customInit() {
    }

}
