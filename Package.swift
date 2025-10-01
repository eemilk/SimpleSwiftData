// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "SimpleSwiftData",
  platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10)],
  products: [
    .library(name: "SimpleSwiftData", targets: ["SimpleSwiftData"]),
    .library(name: "SimpleSwiftDataMacros", targets: ["SimpleSwiftDataMacros"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "509.0.0")
  ],
  targets: [
    .target(
      name: "SimpleSwiftData",
      dependencies: [
        .target(name: "SimpleSwiftDataMacros")
      ]
    ),
    .macro(
      name: "SimpleSwiftDataMacros",
      dependencies: [
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
        .product(name: "SwiftSyntaxMacros",    package: "swift-syntax"),
        .product(name: "SwiftSyntax",          package: "swift-syntax"),
      ]
    ),
  ]
)

