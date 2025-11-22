//
//  ContactOption+Email.swift
//  SpeziContact
//
//  Created by Paul Kraft on 25.09.2024.
//

import SwiftUI


extension ContactOption {
    
    
    /// A ``ContactOption`` encoding a possibility to email an individual using a collection of email addresses.
    /// - Parameters:
    ///   - addresses: The email addresses to email to.
    ///   - subject: An optional subject line for the email.
    public static func email(addresses: [String], subject: String? = nil) -> ContactOption {
        ContactOption(
            image: Image(systemName: "envelope.fill"),
            title: String(localized: "Email", bundle: .module, comment: "Contact Option")
        ) {
            guard let subject = (subject ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: "mailto:\(addresses.joined(separator: ";"))?subject=\(subject)"), UIApplication.shared.canOpenURL(url) else {
                UIApplication.shared.presentAlert(
                    title: String(localized: "Email", bundle: .module),
                    message: String(
                        localized: "Email unavailable. You can manually reach out to \(addresses.joined(separator: ", "))",
                        bundle: .module,
                        comment: "Email unavailable. Manual approach."
                    )
                )
                return
            }
            UIApplication.shared.open(url)
        }
    }
}
