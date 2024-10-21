//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI

extension ContactOption {
    /// A ``ContactOption`` encoding a possibility to call an individual using a phone number.
    /// - Parameter number: The phone number to be called.
    public static func text(_ number: String) -> ContactOption {
        ContactOption(
            image: Image(systemName: "message.fill"),
            title: String(localized: "Text", bundle: .module, comment: "Contact Option")
        ) {
            guard let url = URL(string: "sms:\(number)"), UIApplication.shared.canOpenURL(url) else {
                UIApplication.shared.presentAlert(
                    title: String(localized: "Text", bundle: .module),
                    message: String(localized: "Text unavailable. You can manually reach out to \(number)", bundle: .module, comment: "Text unavailable. Manual approach.")
                )
                return
            }
            UIApplication.shared.open(url)
        }
    }
}
