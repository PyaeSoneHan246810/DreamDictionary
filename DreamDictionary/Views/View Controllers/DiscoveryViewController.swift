//
//  DiscoveryViewController.swift
//  DreamDictionary
//
//  Created by Dylan on 25/2/2568 BE.
//

import UIKit

class DiscoveryViewController: UIViewController {
    // MARK: - IB OUTLETS
    @IBOutlet weak var cvDiscovery: UICollectionView!
    @IBOutlet weak var errorView: ErrorView!
    
    // MARK: - VIEW MODELS
    let viewModel: DiscoveryViewModel = .init()
    
    // MARK: - OVERRIDE FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupViews()
        loadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let layout = cvDiscovery?.collectionViewLayout else { return }
        layout.invalidateLayout()
    }
    
    // MARK: - FUNCTIONS
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    private func setupViews() {
        errorView.isHidden = true
        setupDiscoveryCollectionView()
    }
    
    private func setupDiscoveryCollectionView() {
        cvDiscovery.delegate = self
        cvDiscovery.dataSource = self
        cvDiscovery.register(UINib(nibName: CollectionViewsConstants.discoveryCollectionViewCell, bundle: .main), forCellWithReuseIdentifier: CollectionViewsConstants.discoveryCollectionViewCell)
        cvDiscovery.showsVerticalScrollIndicator = false
    }
    
    private func reloadDiscoveryCollectionView() {
        cvDiscovery.reloadData()
    }
    
    private func loadData() {
        viewModel.getHeaders()
    }
}

extension DiscoveryViewController: DiscoveryViewModelDelegate {
    // MARK: - DELEGATE FUNCTIONS
    func getHeadersSuccess() {
        reloadDiscoveryCollectionView()
        errorView.isHidden = true
    }
    
    func getHeadersFailure(errorMessage: String) {
        print("Failed: \(errorMessage)")
        errorView.isHidden = false
        errorView.errorMessage = errorMessage
    }
}
