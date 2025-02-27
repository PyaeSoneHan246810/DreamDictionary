//
//  UIView+Extensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

extension UIView {
    func loadUIViewFromXib(named name: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        let uiView = nib.instantiate(withOwner: self).first as? UIView
        return uiView
    }
}
