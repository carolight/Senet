// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Senet",
    platforms: [
      .macOS(.v13), .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Senet",
            targets: ["Senet"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Senet",
            dependencies: [],
            resources: [
              .process("Shaders/Shaders.metal"),
              .process("Shaders/Lighting.metal"),
              .process("Shaders/Shadow.metal"),
              .process("Shaders/PBR.metal"),
              .process("Shaders/Deferred.metal"),
              .process("Geometry/icosphere.obj"),
              .process("Geometry/icosphere.mtl")
            ]),
        .testTarget(
            name: "SenetTests",
            dependencies: ["Senet"]),

    ]
)