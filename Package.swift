// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "KokoroSwift",
  platforms: [
    .iOS(.v18), .macOS(.v15)
  ],
  products: [
    .library(
      name: "KokoroSwift",
      type: .dynamic,
      targets: ["KokoroSwift"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/manascheema/mlx-swift",
      revision: "1e4946b7a45b74243148b113c318c672e7460dd1"
    ),
    // .package(url: "https://github.com/mlalma/eSpeakNGSwift", from: "1.0.1"),
    .package(url: "https://github.com/manascheema/MisakiSwift", revision: "8cf6aabd409a68e2108442e8a7970c3e617adbd7"),
    .package(
      url: "https://github.com/manascheema/MLXUtilsLibrary",
      revision: "086b4c13c1c716d80f7de25c68cc5d22855cb472"
    )
  ],
  targets: [
    .target(
      name: "KokoroSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXRandom", package: "mlx-swift"),
        .product(name: "MLXFFT", package: "mlx-swift"),
        // .product(name: "eSpeakNGLib", package: "eSpeakNGSwift"),
        .product(name: "MisakiSwift", package: "MisakiSwift"),
        .product(name: "MLXUtilsLibrary", package: "MLXUtilsLibrary")
      ],
      resources: [
       .process("Resources")
      ]
    ),
    .testTarget(
      name: "KokoroSwiftTests",
      dependencies: ["KokoroSwift"]
    ),
  ]
)
