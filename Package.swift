// swift-tools-version:5.7

//
// This source file is part of the CardinalKit open-source project
// 
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
// 
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "CardinalKitContact",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "CardinalKitContact", targets: ["CardinalKitContact"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordBDHG/CardinalKit", .upToNextMinor(from: "0.3.5"))
    ],
    targets: [
        .target(
            name: "CardinalKitContact",
            dependencies: [
                .product(name: "Views", package: "CardinalKit")
            ]
        ),
        .testTarget(
            name: "CardinalKitContactTests",
            dependencies: [
                .target(name: "CardinalKitContact")
            ]
        )
    ]
)
