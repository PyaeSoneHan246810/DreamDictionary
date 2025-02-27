//
//  SearchItemsViewController.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class SearchItemsViewController: UIViewController {
    // MARK: - IB OUTLETS
    @IBOutlet weak var tbSearchItems: UITableView!
    @IBOutlet weak var emptySearchResultsView: UIStackView!
    
    // MARK: - VIEW MODELS
    let viewModel: SearchItemsViewModel = .init()
    
    // MARK: - COMPUTED PROPERTIES
    var items: [Item] {
        viewModel.data.searchItems
    }
    
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
        emptySearchResultsView.isHidden = true
        setupNavigationTitle()
        setupSearchItemsTableView()
    }
    
    private func setupNavigationTitle() {
        self.navigationItem.title = "Search Results"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupSearchItemsTableView() {
        tbSearchItems.delegate = self
        tbSearchItems.dataSource = self
        tbSearchItems.rowHeight = UITableView.automaticDimension
        tbSearchItems.estimatedRowHeight = 160.0
        tbSearchItems.separatorStyle = .none
        tbSearchItems.showsVerticalScrollIndicator = false
        tbSearchItems.register(UINib(nibName: TableViewsConstants.itemsTableViewCell, bundle: .main), forCellReuseIdentifier: TableViewsConstants.itemsTableViewCell)
    }
    
    private func reloadSearchItemsTableView() {
        tbSearchItems.reloadData()
    }
    
    private func loadData() {
        viewModel.getItems()
    }
}

extension SearchItemsViewController: SearchItemsViewModelDelegate {
    // MARK: - DELEGATE FUNCTIONS
    func getItemsSuccess() {
        reloadSearchItemsTableView()
        emptySearchResultsView.isHidden = !items.isEmpty
    }
    
    func getItemsFailure(errorMessage: String) {
        print("Failed: \(errorMessage)")
        AppRouter.popViewController(from: self)
    }
}
