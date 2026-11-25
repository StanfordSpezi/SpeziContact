//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import Contacts
@testable import SpeziContact
import SwiftUI
import Testing


@MainActor
@Suite("Contact")
struct SpeziContactTests {
    @Test("Contact keeps its information and contact options")
    func contactInformation() {
        let contact = Contact(
            name: PersonNameComponents(givenName: "Leland", familyName: "Stanford"),
            image: Image(systemName: "figure.wave.circle"),
            title: "University Founder",
            description: "Founder of Stanford University.",
            organization: "Stanford University",
            address: CNMutablePostalAddress(),
            contactOptions: [
                .call("+1 (650) 723-2300"),
                .text("+1 (650) 723-2300"),
                .email(addresses: ["contact@stanford.edu"])
            ]
        )

        #expect(contact.name.givenName == "Leland")
        #expect(contact.title == "University Founder")
        #expect(contact.organization == "Stanford University")
        #expect(contact.description == "Founder of Stanford University.")
        #expect(contact.address != nil)
        #expect(contact.contactOptions.map(\.title) == ["Call", "Text", "Email"])
    }

    @Test("Each contact option has a unique identifier")
    func uniqueContactOptionIdentifiers() {
        let options: [ContactOption] = [.call("1"), .call("1"), .text("1")]
        #expect(Set(options.map(\.id)).count == options.count)
    }
}
