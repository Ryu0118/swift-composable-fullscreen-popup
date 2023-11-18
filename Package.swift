// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-composable-fullscreen-popup",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ComposableFullscreenPopup",
            targets: ["ComposableFullscreenPopup"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Ryu0118/swift-fullscreen-popup", from: "0.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ComposableFullscreenPopup",
            dependencies: [
                .product(name: "FullscreenPopup", package: "swift-fullscreen-popup"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "ComposableFullscreenPopupTests",
            dependencies: ["ComposableFullscreenPopup"]
        ),
    ]
)
