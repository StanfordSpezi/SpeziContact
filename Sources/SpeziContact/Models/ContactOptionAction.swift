//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// A type handling the action to be performed by a ContactOption.
public protocol ContactOptionAction {
    
    /// Handles the event of the contact option being selected by performing the action.
    @MainActor
    func handle()
    
}
