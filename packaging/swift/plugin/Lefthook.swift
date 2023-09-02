//
//  Lefthook.swift
//
//
//  Created by Chris on 8/24/23.
//

import Foundation
import PackagePlugin

@main
struct LefthookPlugin: CommandPlugin {
    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        let lefthook = try context.tool(named: "lefthook")
        let process = Process()

        process.executableURL = URL(filePath: lefthook.path.string)
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()

        // Check whether the `docc preview` invocation was successful.
        guard process.terminationReason == .exit && process.terminationStatus == 0 else {
            Diagnostics.error("""
                'lefthook' invocation failed with a nonzero exit code: '\(process.terminationStatus)'.

                Note: The lefthook plugin requires passing the '--disable-sandbox' flag
                to the Swift Package Manager because it's running in a sandboxed environment,
                and that file reading and writing is restricted.

                See 'swift package plugin lefthook --help' for details.
                """
            )

            return
        }
    }
}
