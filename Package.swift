// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Viasualisasi",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Viasualisasi",
            targets: ["Viasualisasi"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Viasualisasi",
            dependencies: [],
            path: "Viasualisasi",
            exclude: ["Info.plist", "Assets.xcassets"],
            resources: []),
        .testTarget(
            name: "VisualisasiTests",
            dependencies: ["Viasualisasi"])
    ]
)
