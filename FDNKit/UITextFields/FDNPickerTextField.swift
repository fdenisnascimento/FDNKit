//
//  PickerTextField.swift
//  DCKit
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit

/// This text field can be used for UIDatePicker and UIPickerView.
/// It has Select/Paste menu disabled, as well as zoom functionality and blinking cursor
@IBDesignable open class FDNPickerTextField: FDNBorderedTextField {

    // MARK: - Initializers


    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Building control

    override open func customInit() {
        super.customInit()

        tintColor = UIColor.clear
    }

    override open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.isEnabled = false
        }
        super.addGestureRecognizer(gestureRecognizer)
    }


    /**
     Disables copy/cut/paste/select all menu.

     - note: http://stackoverflow.com/questions/1426731/how-disable-copy-cut-select-select-all-in-uitextview

     - parameter action: A selector.
     - parameter sender: A sender.

     - returns: canPerformAction.
     */
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

}
