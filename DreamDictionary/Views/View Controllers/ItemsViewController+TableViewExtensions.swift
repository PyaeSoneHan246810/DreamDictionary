//
//  ItemsViewController+TableViewExtensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

extension ItemsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - COMPUTED PROPERTIES
    var items: [Item] {
        viewModel.data.items
    }
    
    // MARK: - DELEGATE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewsConstants.itemsTableViewCell) as? ItemsTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.config(item: item)
        cell.selectionStyle = .none
        return cell
    }

}
