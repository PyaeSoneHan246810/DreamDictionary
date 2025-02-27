//
//  DiscoveryViewModel.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

// MARK: - VIEW MODEL
class DiscoveryViewModel {
    // MARK: - DATA
    var data: DiscoveryViewModelData = .init()
    
    // MARK: - DELEGATE
    weak var delegate: DiscoveryViewModelDelegate?
    
    // MARK: - FUNCTIONS
    func getHeaders() {
        do {
            let dictionary: Dictionary = try Bundle.main.decodeJsonFile(Constants.jsonFileName)
            data.headers = dictionary.headers
            delegate?.getHeadersSuccess()
        } catch {
            if let error = error as? FileDecodingError {
                let errorMessage = error.localizedDescription
                delegate?.getHeadersFailure(errorMessage: errorMessage)
            } else {
                delegate?.getHeadersFailure(errorMessage: "Could not load data.")
            }
        }
    }
}

// MARK: - DATA
struct DiscoveryViewModelData {
    var headers: [Header] = []
}

// MARK: - DELEGATE
protocol DiscoveryViewModelDelegate: AnyObject {
    func getHeadersSuccess()
    func getHeadersFailure(errorMessage: String)
}
