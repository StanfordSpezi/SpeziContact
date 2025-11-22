//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI

extension ContactOption {
    public static func call(_ number: String) -> ContactOption {
        .init(
            image: Image(systemName: "phone.fill"),
            title: ""
        ) {
            guard let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) else {
                UIApplication.shared.presentAlert(
                    title: String(localized: "Call", bundle: .module),
                    message: String(
                        localized: "Call unavailable. You can manually reach out to \(number)",
                        bundle: .module,
                        comment: "Call unavailable. Manual approach."
                    )
                )
                return
            }
            UIApplication.shared.open(url)
        }
    }
}
