// swift-tools-version: 5.5
//
// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleNavigation", platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "GoogleNavigation",
      targets: ["GoogleNavigationTarget"]),
  ],
  dependencies: [
    .package(url: "https://github.com/googlestaging/ios-maps-sdk", .exact("8.3.1")),
  ],
  targets: [
    .binaryTarget(name: "GoogleNavigation", url: "https://dl.google.com/geosdk/swiftpm/5.4.0/GoogleNavigation_3p.xcframework.zip", checksum: "0c581d9738a7e0a61d63e38184b606013f105b843bb06a8d39adba4ae1331b42"),
    .target(
      name: "GoogleNavigationTarget",
      dependencies: [
        "GoogleNavigation",
        .product(name: "GoogleMaps", package: "ios-maps-sdk"),
        .product(name: "GoogleMapsCore", package: "ios-maps-sdk"),
        .product(name: "GoogleMapsBase", package: "ios-maps-sdk"),
        .product(name: "GoogleMapsM4B", package: "ios-maps-sdk"),],
      path: "GoogleNavigation",
      sources: ["GMSEmpty.m"],
      resources: [
        .copy("Resources/GoogleNavigation.bundle")
      ],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("xml2"),
        .linkedFramework("Accelerate"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("CoreText"),
        .linkedFramework("GLKit"),
        .linkedFramework("ImageIO"),
        .linkedFramework("Metal"),
        .linkedFramework("OpenGLES"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("Security"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
        .linkedFramework("UserNotifications"),
        .linkedFramework("WebKit"),
      ]
    ),
  ]
)
