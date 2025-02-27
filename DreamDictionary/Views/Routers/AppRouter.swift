//
//  AppRouter.swift
//  DreamDictionary
//
//  Created by Dylan on 26/2/2568 BE.
//

import UIKit

class AppRouter {
    static func pushViewController<T: UIViewController>(
        from parentViewController: UIViewController,
        to identifier: String,
        of type: T.Type,
        in storyboardName: String,
        configure: ((T) -> Void)? = nil
    ) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        if let childViewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T {
            configure?(childViewController)
            parentViewController.navigationController?.pushViewController(childViewController, animated: true)
        }
    }
    
    static func popViewController(from parentViewController: UIViewController) {
        parentViewController.navigationController?.popViewController(animated: true)
    }
}
