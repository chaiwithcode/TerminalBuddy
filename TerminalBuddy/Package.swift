// swift-tools-version: 6.2
//
//  Package.swift
//  Terminal Buddy
//
//  Created by Deepak Sharma on 12/07/2025.
//  Copyright © 2025 ChaiWithCode. All rights reserved.
//
// The swift-tools-version declares the minimum version of Swift required to build this package.
//

import PackageDescription

let package = Package(
    name: "TerminalBuddy",
    platforms: [.macOS(.v26)],
    targets: [
        .executableTarget(
            name: "TerminalBuddy",
            swiftSettings: [
                .unsafeFlags([
                    "-framework", "FoundationModels"
                ])
            ]
        ),
    ]
)
