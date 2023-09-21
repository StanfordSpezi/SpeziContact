<!--

This source file is part of the Stanford Spezi open-source project.

SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)

SPDX-License-Identifier: MIT
  
-->

# Spezi Contact

[![Build and Test](https://github.com/StanfordSpezi/SpeziContact/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/StanfordSpezi/SpeziContact/actions/workflows/build-and-test.yml)
[![codecov](https://codecov.io/gh/StanfordSpezi/SpeziContact/branch/main/graph/badge.svg?token=YWyxmie4aT)](https://codecov.io/gh/StanfordSpezi/SpeziContact)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7803121.svg)](https://doi.org/10.5281/zenodo.7803121)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FStanfordSpezi%2FSpeziContact%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/StanfordSpezi/SpeziContact)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FStanfordSpezi%2FSpeziContact%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/StanfordSpezi/SpeziContact)

The Spezi Contact module provides user interface components to display customizable contact information in an application.

## Overview

The Spezi Contact Swift Package provides a [Spezi Component](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/component) ([`SpeziContact`](https://swiftpackageindex.com/stanfordspezi/spezicontact/documentation/spezicontact)) that enables displaying contact information in an application.

| ![Screenshot showing a ContactsList rendered within the Spezi Template Application.](Sources/SpeziContact/SpeziContact.docc/Resources/Overview.png#gh-light-mode-only) ![Screenshot showing a ContactsList rendered within the Spezi Template Application.](Sources/SpeziContact/SpeziContact.docc/Resources/Overview-dark.png#gh-dark-mode-only) |
 |:---:|
 | A ``ContactsList`` rendered in the Spezi Template Application. |

## Setup

### Add Spezi Contact as a Dependency

You need to add the Spezi Contact Swift package to
[your app in Xcode](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app#) or
[Swift package](https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode#Add-a-dependency-on-another-Swift-package).

## Example

The Contact module enables displaying contact information in an application. 
Information can be encoded in ``Contact`` and ``ContactOption`` to configure the contact views.
The ``ContactView`` and ``ContactsList`` can display the contact information in a card-like layout and list.

The following example shows how ``Contact``s can be created to encode an individual's contact information and displayed in a ``ContactsList`` within a SwiftUI ``View``.

```swift
struct ContactsExample: View {
    let contact = Contact(
        image: Image(systemName: "figure.wave.circle"),
        name: PersonNameComponents(givenName: "Leland", familyName: "Stanford"),
        title: "Founder",
        description: """
        Leland Stanford is the founder of Stanford University.
        """,
        organization: "Stanford University",
        address: {
            let address = CNMutablePostalAddress()
            address.country = "USA"
            address.state = "CA"
            address.postalCode = "94305"
            address.city = "Stanford"
            address.street = "450 Serra Mall"
            return address
        }(),
        contactOptions: [
            .call("+1 (650) 123-4567"),
            .text("+1 (650) 123-4567"),
            .email(addresses: ["example@stanford.edu"], subject: "Hi!")
        ]
    )
    
    var body: some View {
        ContactsList(contacts: [contact])
    }
}
```

For more information, please refer to the [API documentation](https://swiftpackageindex.com/StanfordSpezi/SpeziContact/documentation).


## The Spezi Template Application

The [Spezi Template Application](https://github.com/StanfordSpezi/SpeziTemplateApplication) provides a great starting point and example using the `SpeziContact` module.


## Contributing

Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/StanfordSpezi/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/StanfordSpezi/.github/blob/main/CODE_OF_CONDUCT.md) first.


## License

This project is licensed under the MIT License. See [Licenses](https://github.com/StanfordSpezi/SpeziContact/tree/main/LICENSES) for more information.

![Spezi Footer](https://raw.githubusercontent.com/StanfordSpezi/.github/main/assets/FooterLight.png#gh-light-mode-only)
![Spezi Footer](https://raw.githubusercontent.com/StanfordSpezi/.github/main/assets/FooterDark.png#gh-dark-mode-only)
