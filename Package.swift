// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "GoogleNavigation", platforms: [.iOS(.v14)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GoogleNavigation",
      targets: ["GoogleNavigationTarget"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/dogahe/DogaheMaps", "1.0.15"..."1.0.15"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .binaryTarget(name: "GoogleNavigation", url: "https://dl.google.com/geosdk/swiftpm/5.3.0/GoogleNavigation_3p.xcframework.zip", checksum: "67b7778bf459756febd7a8c2efa025caa0b7fd96e48d182f66543fc5d7a8bfcb"),
    .target(
      name: "GoogleNavigationTarget",
      dependencies: [
        "GoogleNavigation",
        .product(name: "GoogleMaps", package: "DogaheMaps"),
        .product(name: "GoogleMapsCore", package: "DogaheMaps"),
        .product(name: "GoogleMapsBase", package: "DogaheMaps"),
        .product(name: "GoogleMapsM4B", package: "DogaheMaps"),],
      path: "GoogleNavigation",
      sources: ["dummy.m"],
      resources: [
        .copy("Resources/GoogleNavigation.bundle")
      ],
      publicHeadersPath: "Sources"
    ),
  ]
)
