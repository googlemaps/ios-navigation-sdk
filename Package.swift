// swift-tools-version: 5.5
//
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleNavigation", platforms: [.iOS(.v15)],
  products: [.library(name: "GoogleNavigation", targets: ["GoogleNavigationTarget"])],
  dependencies: [.package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "9.1.1")],
  targets: [
    .binaryTarget(
      name: "GoogleNavigation",
      url: "https://dl.google.com/geosdk/swiftpm/9.1.1/GoogleNavigation_3p.xcframework.zip",
      checksum: "c33b005c3ec092a609be1599b786a6c588ba9fe4188e4a17afd6203f9979a6b5"
    ),
    .target(
      name: "GoogleNavigationTarget",
      dependencies: [
        "GoogleNavigation",
        .product(name: "GoogleMaps", package: "ios-maps-sdk"),
      ],
      path: "Navigation",
      sources: ["GMSEmpty.m"],
      resources: [.copy("Resources/GoogleNavigationResources/GoogleNavigation.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("xml2"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CarPlay"),
        .linkedFramework("MapKit"),
        .linkedFramework("Metal"),
        .linkedFramework("WebKit"),
        .linkedFramework("UserNotifications"),
      ]
    ),
  ]
)
