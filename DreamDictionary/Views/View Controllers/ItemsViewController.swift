//
//  ItemsViewController.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class ItemsViewController: UIViewController {
    // MARK: - IB OUTLETS
    @IBOutlet weak var tbItems: UITableView!
    @IBOutlet weak var errorView: ErrorView!
    
    // MARK: - VIEW MODELS
    let viewModel: ItemsViewModel = .init()
    
    // MARK: - OVERRIDE FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupViews()
        loadData()
    }
    
    // MARK: - FUNCTIONS
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    private func setupViews() {
        errorView.isHidden = true
        setupNavigationTitle()
        setupItemsTableView()
    }
    
    private func setupNavigationTitle() {
        self.navigationItem.title = viewModel.data.navigationTitle
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupItemsTableView() {
        tbItems.delegate = self
        tbItems.dataSource = self
        tbItems.rowHeight = UITableView.automaticDimension
        tbItems.estimatedRowHeight = 160.0
        tbItems.separatorStyle = .none
        tbItems.showsVerticalScrollIndicator = false
        tbItems.register(UINib(nibName: TableViewsConstants.itemsTableViewCell, bundle: .main), forCellReuseIdentifier: TableViewsConstants.itemsTableViewCell)
    }
    
    private func reloadItemsTableView() {
        tbItems.reloadData()
    }
    
    private func loadData() {
        viewModel.getItems()
    }
}

extension ItemsViewController: ItemsViewModelDelegate {
    // MARK: - DELEGATE FUNCTIONS
    func getItemsSuccess() {
        reloadItemsTableView()
        errorView.isHidden = true
    }
    
    func getItemsFailure(errorMessage: String) {
        print("Failed: \(errorMessage)")
        errorView.isHidden = false
        errorView.errorMessage = errorMessage
    }
}
