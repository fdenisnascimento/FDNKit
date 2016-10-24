//
//  DCPlaceholderTextView.swift
//  DCKitSample
//
//  Created by Denis Nascimento on 10/24/16.
//  Copyright © 2016 Denis Nascimento. All rights reserved.
//


import UIKit


@IBDesignable open class FDNPlaceholderTextView: FDNBorderedTextView {

    /// The string that is displayed when there is no other text in the text view.
    /// This property reads and writes the attributed variant.
    @IBInspectable open var placeholder: String? {
        set {
            if newValue == self.attributedPlaceholder?.string {
                return
            }

            var attributes = [String : AnyObject]()

                attributes[NSFontAttributeName] = font
                attributes[NSForegroundColorAttributeName] = UIColor(white: 0.702, alpha: 1.0)

            if textAlignment != NSTextAlignment.left {
                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = textAlignment
                attributes[NSParagraphStyleAttributeName] = paragraph
            }

            attributedPlaceholder = NSAttributedString(string: newValue ?? "", attributes: attributes)
        }
        get {
            return self.attributedPlaceholder?.string
        }
    }

    /// The attributed string that is displayed when there is no other text in the text view.
    @IBInspectable open var attributedPlaceholder: NSAttributedString? {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var text: String! {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var attributedText: NSAttributedString! {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var contentInset: UIEdgeInsets {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var font: UIFont? {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var textAlignment: NSTextAlignment {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Initialization


    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Placeholder

    /**
     Returns a rect for a placeholder

     - parameter bounds: Text view bounds.
     */
    func placeholderRectForBounds(_ bounds: CGRect) -> CGRect {
        var rect = UIEdgeInsetsInsetRect(bounds, contentInset)

        if responds(to: #selector(getter: UITextView.textContainer)) {
            rect = UIEdgeInsetsInsetRect(rect, textContainerInset)
            let padding = textContainer.lineFragmentPadding
            rect.origin.x = rect.origin.x + padding
            rect.size.width = rect.size.width - padding * 2.0
        } else {
            if contentInset.left == 0.0 {
                rect.origin.x = rect.origin.x + 8.0
            }
            rect.origin.y = rect.origin.y + 8.0
        }

        return rect
    }

    // MARK: - Build control

    open override func customInit() {
        super.customInit()

        NotificationCenter.default.addObserver(self, selector: #selector(FDNPlaceholderTextView.textChanged), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }

    // MARK: - Misc

    open override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Draw placeholder if necessary
        guard text.isEmpty else {
            return
        }
        if let attributedPlaceholder = attributedPlaceholder {
            let placeholderRect = placeholderRectForBounds(bounds)
            attributedPlaceholder.draw(in: placeholderRect)
        }
    }

    open override func insertText(_ text: String) {
        super.insertText(text)

        setNeedsDisplay()
    }

    @objc private func textChanged() {
        setNeedsDisplay()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }

}
