//
//  ContactOptionAction.swift
//  SpeziContact
//
//  Created by Paul Kraft on 25.09.2024.
//

public protocol ContactOptionAction {
    @MainActor func handle()
}
