// swift-tools-version: 5.7
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
  name: "GoogleNavigation", platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "GoogleNavigation", targets: ["GoogleNavigationTarget", "GoogleNavigationSwiftTarget"])
  ], dependencies: [.package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "10.0.0")],
  targets: [
    .binaryTarget(
      name: "GoogleNavigation",
      url: "https://dl.google.com/geosdk/swiftpm/10.0.0/GoogleNavigation_3p.xcframework.zip",
      checksum: "d8253f8b7745f583514a7bfc509e91eb88753b5168eff6bbd3771692bfb2c63f"
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
    .target(
      name: "GoogleNavigationSwiftTarget",
      path: "NavigationSwift",
      sources: ["Empty.swift"],
      publicHeadersPath: "Sources"
    ),
  ]
)
