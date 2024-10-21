//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


/// Customizable way to get in contact with an individual and usually connected to a `Contact`.
///
/// The following example demonstrates the usage of the `ContactOption` within a `Contact`. For additional details, refer to the ``Contact`` documentation.
/// ```swift
/// Contact(
///     // other parameters for Contact
///     contactOptions: [
///         .call("+1 (123) 456-7890"),
///         .text("+1 (123) 456-7890"),
///         .email(addresses: ["email@address.com"]),
///         // Here is where the custom ContactOption can be used as a part of the contactOptions list
///         ContactOption(
///            image: Image(systemName: "safari.fill"),
///            title: "More Info",
///            action: {
///                // Action that should be performed on pressing this ContactOption (i.e. opening a link for a website)...
///             }
///         )
///     ]
/// )
/// ```
public struct ContactOption {
    let id = UUID()
    /// The image representing the `ContactOption` in the user interface.
    public let image: Image
    /// The title representing the `ContactOption` in the user interface.
    public let title: String
    /// The action that should be taken when a user chooses to use the `ContactOption`.
    public let action: @MainActor () -> Void

    
    /// Encodes a way to get in contact with an individual and usually connected to a `Contact`.
    /// - Parameters:
    ///   - image: The image representing the `ContactOption` in the user interface.
    ///   - title: The title representing the `ContactOption` in the user interface.
    ///   - action: The action that should be taken when a user chooses to use the `ContactOption`.
    public init(image: Image, title: String, action: @escaping @MainActor () -> Void) {
        self.image = image
        self.title = title
        self.action = action
    }
}
