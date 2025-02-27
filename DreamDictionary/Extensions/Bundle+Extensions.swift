//
//  Bundle+Extensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

extension Bundle {
    func decodeJsonFile<T: Decodable>(_ fileName: String) throws -> T {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: ".json") else {
            throw FileDecodingError.fileNotFound
        }
        guard let fileData = try? Data(contentsOf: fileUrl) else {
            throw FileDecodingError.invalidData
        }
        guard let decodedObject = try? JSONDecoder().decode(T.self, from: fileData) else {
            throw FileDecodingError.decodingFailed
        }
        return decodedObject
    }
}
