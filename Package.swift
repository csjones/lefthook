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
        ),
        .library(
            name: "Lefthook_macOS",
            targets: ["Lefthook_macOS"]
        )
    ],
    targets: [
        .executableTarget(
            name: "lefthook",
            dependencies: ["Lefthook_macOS"],
            path: "swift"
        ),
        .binaryTarget(
            name: "Lefthook_macOS",
            url: "https://github.com/csjones/lefthook/releases/latest/download/Lefthook_macOS.xcframework.zip",
            checksum: "8054bf8d5c0dca4e9d267b8acf53aa98d258bef004d9060b363361f56f9c1ec1"
        )
    ]
)
