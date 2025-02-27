//
//  DiscoveryViewController+CollectionViewExtensions.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

extension DiscoveryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - COMPUTED PROPERTIES
    var headers: [Header] {
        viewModel.data.headers
    }
    
    // MARK: - DELEGATE FUNCTIONS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewsConstants.discoveryCollectionViewCell, for: indexPath) as? DiscoveryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let header = headers[indexPath.item]
        cell.configure(header: header)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let header = headers[indexPath.item]
        AppRouter.pushViewController(
            from: self,
            to: "ItemsViewController",
            of: ItemsViewController.self,
            in: "Main"
        ) { itemsVC in
            itemsVC.viewModel.setData(header: header)
        }
    }
}

extension DiscoveryViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - COMPUTED PROPERTIES
    var spacing: CGFloat {
        return 12.0
    }
    
    var numberOfColumns: Int {
        return UIDevice.current.orientation.isLandscape ? 3 : 2
    }
    
    // MARK: - DELEGATE FUNCTIONS
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let leftAndRightInset = spacing * 2
        let spacingBetweenColumns = spacing * CGFloat(numberOfColumns - 1)
        let allSpacingPerRow = spacingBetweenColumns + leftAndRightInset
        let width: CGFloat = (collectionViewWidth - allSpacingPerRow) / CGFloat(numberOfColumns)
        let height: CGFloat = 150.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
}
