// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Lefthook",
    products: [
        .plugin(
            name: "Lefthook",
            targets: [
                "Lefthook"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "Lefthook",
            capability: .command(
                intent: .custom(
                    verb: "lefthook",
                    description: "Execute commands defined in `lefthook.yml`"
                )
            ),
            dependencies: ["lefthook"],
            path: "packaging/swift/plugin"
        ),
//        .binaryTarget(
//            name: "lefthook",
//            url: "https://github.com/csjones/lefthook/releases/download/v0.7.7-2/lefthook.artifactbundle.zip",
//            checksum: "e2ad00e5f158aabbc3abe3e2be2400552e294ea66dde530dd47fb62a42e49c45"
//        ),
        .binaryTarget(name: "lefthook", path: "packaging/swift/lefthook.artifactbundle.zip")
    ],
    swiftLanguageVersions: [.v5]
)
