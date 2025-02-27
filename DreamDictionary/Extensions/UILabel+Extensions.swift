//
//  UILabel+Extensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

extension UILabel {

    func addInterlineSpacing(spacingValue: CGFloat = 2, alignment: NSTextAlignment) {
        guard let textString = text else { return }
        
        let attributedString = NSMutableAttributedString(string: textString)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        paragraphStyle.alignment = alignment

        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))
        
        attributedText = attributedString
    }

}
