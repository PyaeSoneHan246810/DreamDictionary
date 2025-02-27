//
//  Dictionary.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

struct Dictionary: Decodable {
    enum CodingKeys: String, CodingKey {
        case headers = "BlogHeader"
        case items = "BlogDetail"
    }
    let headers: [Header]
    let items: [Item]
}
