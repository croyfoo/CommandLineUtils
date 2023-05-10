// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommandLineUtils",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommandLineUtils",
            targets: ["CommandLineUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut", from: "2.3.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.3"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CommandLineUtils",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Files",
                "ShellOut",
            ]),
        .testTarget(
            name: "CommandLineUtilsTests",
            dependencies: ["CommandLineUtils"]),
    ]
)
