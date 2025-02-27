//
//  DiscoveryCollectionViewCell.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class DiscoveryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    // MARK: - FUNCTIONS
    func configure(header: Header) {
        setupViews()
        loadData(header: header)
    }
    
    private func setupViews() {
        lblSubtitle.addInterlineSpacing(spacingValue: 8.0, alignment: .center)
        cardView.layer.cornerRadius = 16.0
    }
    
    private func loadData(header: Header) {
        lblTitle.text = header.title
        lblSubtitle.text = header.subtitle
    }
}
