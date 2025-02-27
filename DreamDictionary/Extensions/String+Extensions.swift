//
//  String+Extensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
