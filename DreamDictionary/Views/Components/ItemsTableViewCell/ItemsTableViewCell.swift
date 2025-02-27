//
//  ItemsTableViewCell.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var numberCircleView: UIView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    
    // MARK: - FUNCTIONS
    func config(item: Item) {
        setupViews()
        loadData(item: item)
    }
    
    func setupViews() {
        lblContent.addInterlineSpacing(spacingValue: 8.0, alignment: .left)
        numberCircleView.layer.cornerRadius = numberCircleView.frame.width / 2
        numberCircleView.clipsToBounds = true
    }
    
    func loadData(item: Item) {
        lblNumber.text = "\(item.id)"
        lblContent.text = item.content
    }
}
