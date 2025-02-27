//
//  Header.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

struct Header: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "BlogId"
        case content = "BlogTitle"
    }
    let id: Int
    let content: String
    
    var modifiedConent: String {
        return content
            .replacingOccurrences(of: "[", with: "")
            .replacingOccurrences(of: "]", with: "")
    }
    var title: String {
        let startIndex = content.index(content.startIndex, offsetBy: 2)
        let endIndex = content.index(content.startIndex, offsetBy: 3)
        let slicedString = String(content[startIndex..<endIndex])
        return slicedString
    }
    var subtitle: String {
        let startIndex = content.index(content.startIndex, offsetBy: 6)
        let endIndex = content.endIndex
        let slicedString = String(content[startIndex..<endIndex])
        return slicedString
    }
}
