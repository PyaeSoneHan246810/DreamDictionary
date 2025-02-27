//
//  HasApply.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

protocol HasApply { }

extension HasApply {
    func applyWith(closure:(Self) -> ()){
        closure(self)
    }
    
    func apply(closure:(Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
