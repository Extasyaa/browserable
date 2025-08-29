// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "VideoStoryMaker",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "VideoStoryMaker", targets: ["VideoStoryMaker"])
    ],
    dependencies: [
        // Add external package dependencies here
    ],
    targets: [
        .executableTarget(
            name: "VideoStoryMaker",
            path: "VideoStoryMaker",
            exclude: ["Resources/Info.plist"],
            resources: [
                .process("Resources/Assets.xcassets")
            ]
        )
    ]
)
