//
//  ErrorView.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class ErrorView: UIView {
    
    // MARK: - IB OUTLETS
    @IBOutlet weak var imgError: UIImageView?
    @IBOutlet weak var lblErrorMessage: UILabel?
    
    // MARK: - IB INSPECTABLES
    @IBInspectable var errorImage: UIImage? = UIImage(systemName: "exclamationmark.triangle.fill") {
        didSet {
            setUpView()
        }
    }
    @IBInspectable var errorMessage: String = "Something went wrong!" {
        didSet {
            setUpView()
        }
    }
    
    // MARK: - OVERRIDE FUNCTIONS
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpXib()
    }
    
    // MARK: - FUNCTIONS
    private func setUpXib() {
        guard let uiView = loadUIViewFromXib(named: "ErrorView") else {
            return
        }
        uiView.frame = bounds
        uiView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        uiView.backgroundColor = .clear
        addSubview(uiView)
        setUpView()
    }
    
    private func setUpView() {
        imgError?.image = errorImage
        lblErrorMessage?.text = errorMessage
    }
}
