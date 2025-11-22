//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import UIKit

extension UIApplication {
    @MainActor private var rootViewController: UIViewController? {
        connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .rootViewController
    }

    @MainActor
    internal func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "Ok", bundle: .module, comment: "Dismiss alert"), style: .default))
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}
