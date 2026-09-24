//
//  ContactOption+Website.swift
//  SpeziContact
//
//  Created by Paul Kraft on 21.10.2024.
//

import SwiftUI

extension ContactOption {
    /// A ``ContactOption`` encoding a possibility to open a website.
    /// - Parameters:
    ///   - url: The url to open.
    public static func website(url: URL) -> ContactOption {
        ContactOption(
            image: Image(systemName: "safari.fill"),
            title: String(localized: "Website", bundle: .module, comment: "Contact Option")
        ) {
            guard UIApplication.shared.canOpenURL(url) else {
                UIApplication.shared.presentAlert(
                    title: String(localized: "Website", bundle: .module, comment: "Contact Option"),
                    message: String(localized: "Could not open url. You may want to manually access `\(url.absoluteString)`.", bundle: .module, comment: "Contact Option")
                )
                return
            }
            
            UIApplication.shared.open(url)
        }
    }
}

