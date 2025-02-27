//
//  Item.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

struct Item: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "BlogDetailId"
        case headerId = "BlogId"
        case content = "BlogContent"
    }
    let id: Int
    let headerId: Int
    let content: String
}
