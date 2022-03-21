// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "lefthook",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "lefthook",
            targets: ["lefthook"]
        )
    ],
    targets: [
        .executableTarget(
            name: "lefthook",
            dependencies: ["Lefthook"],
            path: "swift"
        ),
        .binaryTarget(
            name: "Lefthook",
            url: "https://github.com/csjones/lefthook/releases/download/v0.7.7-1/Lefthook.xcframework.zip",
            checksum: "042cb2a8eca9159606d6767cf25bf5283b5d788d452454430eeae843212343cd"
        )
    ]
)
