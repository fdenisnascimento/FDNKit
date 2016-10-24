//
//  MandatoryEmailTextField.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// This field is also checks if the entered value is a valid email address.
@IBDesignable open class FDNMandatoryEmailTextField: FDNMandatoryTextField {

    // MARK: - Initializers


    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Validation

    override open func isValid() -> Bool {
        var valid = isValidEmail(text ?? "")

        // If the field is Mandatory and empty - it's invalid
        if text == "" {
            valid = !isMandatory
        }

        isSelected = !valid
        return valid
    }

    open func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

}
