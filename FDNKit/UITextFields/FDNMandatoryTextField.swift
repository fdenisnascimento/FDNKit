//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// Highlights the text field if the entered value is false.
@IBDesignable open class FDNMandatoryTextField: FDNBorderedTextField {



    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open var isSelected: Bool {
        didSet {
            updateColor()
        }
    }

    /// Border color for Highlighted state.
    @IBInspectable open var highlightedBorderColor: UIColor = UIColor.red {
        didSet {
            updateColor()
        }
    }

    /// If `true`, `isValid()` will return `false` for the empty control.
    @IBInspectable open var isMandatory: Bool = true

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        updateColor()
        let _ = isValid()
        self.addTarget(self, action: #selector(FDNMandatoryTextField.isValid), for: UIControlEvents.editingChanged)
    }

    // MARK: - Validation

    /**
     Checks if the field's value is valid. Can be overriden by subclasses.

     - returns: True, if the field is mandatory and value is not empty.
     */
    open func isValid() -> Bool {
        if isMandatory {
            let valid = !(text ?? "").isEmpty
            isSelected = !valid
            return valid
        } else {
            return true
        }
    }

    // MARK: - Misc

    func updateColor() {
        layer.borderColor = isSelected ? highlightedBorderColor.cgColor : normalBorderColor.cgColor
    }

}
