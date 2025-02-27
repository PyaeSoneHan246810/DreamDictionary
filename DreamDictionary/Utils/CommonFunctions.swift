//
//  CommonFunctions.swift
//  DreamDictionary
//
//  Created by Dylan on 27/2/2568 BE.
//

import UIKit
import Toast

func showToastMessage(image: UIImage?, titleMessage: String, subTitleMessage: String? = nil) {
    guard let image else {
        return
    }
    let config = ToastConfiguration(
        direction: .bottom,
        dismissBy: [.time(time: 2.0), .tap, .swipe(direction: .natural)],
        animationTime: 0.2,
        allowToastOverlap: false
    )
    let toast = Toast.default(
        image: image,
        title: titleMessage,
        subtitle: subTitleMessage,
        config: config
    )
    toast.show()
}
