//
//  YPPermissionDeniedPopup.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 08/03/2018.
//  Copyright © 2018 Yummypets. All rights reserved.
//

import UIKit

class YPPermissionDeniedPopup {
    
    static func popup(cancelBlock: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: ypLocalized("YPImagePickerPermissionDeniedPopupTitle"),
                                      message: ypLocalized("YPImagePickerPermissionDeniedPopupMessage"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ypLocalized("YPImagePickerPermissionDeniedPopupCancel"),
                                      style: UIAlertActionStyle.cancel,
                                      handler: { _ in
                                        cancelBlock()
        }))
        alert.addAction(UIAlertAction(title: ypLocalized("YPImagePickerPermissionDeniedPopupGrantPermission"),
                                      style: .default,
                                      handler: { _ in
                                        if #available(iOS 10.0, *) {
                                            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
                                        } else {
                                            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
                                        }
        }))
        return alert
    }
}
