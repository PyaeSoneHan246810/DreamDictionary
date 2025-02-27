//
//  ItemsViewModel.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import Foundation

// MARK: - VIEW MODEL
class ItemsViewModel {
    // MARK: - DATA
    var data: ItemsViewModelData = .init()
    
    // MARK: - DELEGATE
    weak var delegate: ItemsViewModelDelegate?
    
    // MARK: - FUNCTIONS
    func setData(header: Header) {
        data.header = header
    }
    
    func getItems() {
        do {
            let dictionary: Dictionary = try Bundle.main.decodeJsonFile(Constants.jsonFileName)
            if let header = data.header {
                data.items = dictionary.items.filter { item in
                    item.headerId == header.id
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
struct ItemsViewModelData {
    var header: Header?
    var items: [Item] = []
    var navigationTitle: String? {
        header?.modifiedConent
    }
}

// MARK: - DELEGATE
protocol ItemsViewModelDelegate: AnyObject {
    func getItemsSuccess()
    func getItemsFailure(errorMessage: String)
}
