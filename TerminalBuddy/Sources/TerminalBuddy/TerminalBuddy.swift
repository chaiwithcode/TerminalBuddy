//
//  TerminalBuddy.swift
//  Terminal Buddy
//
//  Created by Deepak Sharma on 12/07/2025.
//  Copyright © 2025 ChaiWithCode. All rights reserved.
//

import FoundationModels

@main
struct TerminalBuddy {
    static func main() async {
        // ANSI color codes
        let blue = "\u{001B}[1;94m"  // Bright blue for 🤖
        let red = "\u{001B}[0;31m"   // Red for errors
        let reset = "\u{001B}[0m"

        // Check if device supports the language model
        let availability = SystemLanguageModel.default.availability

        guard availability == .available else {
            let reason = describeModelAvailability(for: availability)
            print("\(red)❌ TerminalBuddy is not available on this device.\(reset)")
            print("\(red)🔒 Reason: \(reason)\(reset)")
            return
        }

        let prompt = CommandLine.arguments.dropFirst().joined(separator: " ")

        guard !prompt.isEmpty else {
            print("""
            🤖 TerminalBuddy — Apple Intelligence at your command

            Usage:
              terminalbuddy "Your question here"

            Example:
              terminalbuddy "What’s the weather in London today?"

            """)
            return
        }

        do {
            let session = LanguageModelSession(model: .default)

            let response = try await session.respond(to: prompt)
         
            print("\(blue)🤖:\(response.content)\(reset) ")
        } catch {
            // Print error in red
            print("\(red)❌ Failed to generate response: \(error.localizedDescription)\(reset)")
        }
    }

    /// Provides a human-readable explanation of model availability status.
    private static func describeModelAvailability(for availability: SystemLanguageModel.Availability) -> String {
        switch availability {
        case .available:
            return "Available"
        case .unavailable(let reason):
            switch reason {
            case .deviceNotEligible:
                return "Device not eligible"
            case .appleIntelligenceNotEnabled:
                return "Apple Intelligence not enabled in Settings"
            case .modelNotReady:
                return "Model assets not downloaded"
            @unknown default:
                return "Unknown unavailability reason"
            }
        @unknown default:
            return "Unknown availability status"
        }
    }
}
