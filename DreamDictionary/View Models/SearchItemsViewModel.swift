//
//  SearchItemsViewModel.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

// MARK: - VIEW MODEL
class SearchItemsViewModel {
    // MARK: - DATA
    var data: SearchItemsViewModelData = .init()
    
    // MARK: - DELEGATE
    weak var delegate: SearchItemsViewModelDelegate?
    
    // MARK: - FUNCTIONS
    func setData(searchText: String) {
        data.searchText = searchText
    }
    
    func getItems() {
        do {
            let dictionary: Dictionary = try Bundle.main.decodeJsonFile(Constants.jsonFileName)
            if let searchText = data.searchText {
                data.searchItems = dictionary.items.filter { item in
                    item.content.lowercased().contains(searchText.lowercased())
                }
                delegate?.getItemsSuccess()
            } else {
                delegate?.getItemsFailure(errorMessage: "Could not load data.")
            }
        } catch {
            if let error = error as? FileDecodingError {
                let errorMessage = error.localizedDescription
                delegate?.getItemsFailure(errorMessage: errorMessage)
            } else {
                delegate?.getItemsFailure(errorMessage: "Could not load data.")
            }
        }
    }
}

// MARK: - DATA
struct SearchItemsViewModelData {
    var searchText: String?
    var searchItems: [Item] = []
}

// MARK: - DELEGATE
protocol SearchItemsViewModelDelegate: AnyObject {
    func getItemsSuccess()
    func getItemsFailure(errorMessage: String)
}
