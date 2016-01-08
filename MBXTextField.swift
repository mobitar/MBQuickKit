//
//  MBXTextField.swift
//  ParkWhiz
//
//  Created by Mo Bitar on 12/4/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

import UIKit

class MBXTextField: UITextField {

    var textInset: CGSize = CGSizeZero
    var placeholderColor: UIColor?
    var placeholderFont: UIFont!
    
    override var placeholder: String? {
        didSet {
            if self.placeholderColor != nil && placeholder != nil {
                self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName : self.placeholderColor!, NSFontAttributeName : self.placeholderFont])
            }
        }
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, textInset.width, textInset.height)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, textInset.width, textInset.height)
    }

}
