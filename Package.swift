// swift-tools-version: 5.9
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
  name: "GoogleNavigation", platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "GoogleNavigation", targets: ["GoogleNavigationTarget", "GoogleNavigationSwiftTarget"])
  ], dependencies: [.package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "11.3.0")],
  targets: [
    .binaryTarget(
      name: "GoogleNavigation",
      url: "https://dl.google.com/geosdk/swiftpm/11.3.0/GoogleNavigation_3p.xcframework.zip",
      checksum: "4ac3a8723c99df5264eea5b2836fbd4aa3f400cbfcdb71e5b69250780f7561ae"
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
