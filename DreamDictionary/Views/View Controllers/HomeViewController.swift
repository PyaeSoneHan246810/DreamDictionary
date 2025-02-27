//
//  HomeViewController.swift
//  DreamDictionary
//
//  Created by Dylan on 25/2/2568 BE.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - IB OUTLETS
    @IBOutlet weak var lblSearchTitle: UILabel!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    // MARK: - COMPUTED PROPERTIES
    private var searchText: String {
        (tfSearch.text ?? "").trimmed()
    }
    
    private var isSearchTextValid: Bool {
        searchText.isNotEmpty
    }
    
    // MARK: - OVERRIDE FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - FUNCTIONS
    private func setupViews() {
        lblSearchTitle.addInterlineSpacing(spacingValue: 12.0, alignment: .center)
        tfSearch.layer.applyWith {
            $0.masksToBounds = true
            $0.borderColor = UIColor.accent.cgColor.copy(alpha: 0.75)
            $0.borderWidth = 1.5
            $0.cornerRadius = 8.0
        }
        tfSearch.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        btnSearch.widthAnchor.constraint(equalToConstant: 160.0).isActive = true
    }
    
    // MARK: - IB ACTIONS
    @IBAction func onBthSearchTapped(_ sender: Any) {
        if isSearchTextValid {
            AppRouter.pushViewController(
                from: self,
                to: "SearchItemsViewController",
                of: SearchItemsViewController.self,
                in: "Main"
            ) { searchItemsVC in
                searchItemsVC.viewModel.setData(searchText: self.searchText)
            }
        } else {
            showToastMessage(
                image: UIImage(systemName: "exclamationmark.bubble.fill"),
                titleMessage: "Please enter some text to search."
            )
        }
    }
}
