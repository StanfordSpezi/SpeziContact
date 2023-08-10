// swift-tools-version:5.7

//
// This source file is part of the Stanford Spezi open-source project
// 
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
// 
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "SpeziContact",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SpeziContact", targets: ["SpeziContact"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordSpezi/SpeziViews", .upToNextMinor(from: "0.4.0"))
    ],
    targets: [
        .target(
            name: "SpeziContact",
            dependencies: [
                .product(name: "SpeziViews", package: "SpeziViews")
            ]
        ),
        .testTarget(
            name: "SpeziContactTests",
            dependencies: [
                .target(name: "SpeziContact")
            ]
        )
    ]
)
