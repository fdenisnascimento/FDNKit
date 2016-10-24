//
//  MandatoryNumberTextField.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// Allows to set a max possible value.
@IBDesignable open class FDNMandatoryNumberTextField: FDNMandatoryTextField {

    // MARK: - Initializers


    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// The field's value will be compared against this property.
    /// - seealso: `isValid()`
    @IBInspectable open var maxValue: Float = 999

    // MARK: - Build control

    override open func customInit() {
        super.customInit()
        keyboardType = UIKeyboardType.decimalPad
    }

    // MARK: - Validation

    override open func isValid() -> Bool {
        var valid = true

        if let value = Float(text ?? "") {
            valid = value < maxValue
        } else {
            // If the field is Mandatory and empty - it's invalid
            valid = !isMandatory
        }

        isSelected = !valid
        return valid
    }

}
