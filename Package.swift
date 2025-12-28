// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "XLPagerTabStrip",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "XLPagerTabStrip",
            targets: ["XLPagerTabStrip"]
        )
    ],
    targets: [
        .target(
            name: "XLPagerTabStrip",
            path: "Sources",
            resources: [.process("ButtonCell.xib")]
        ),
        .testTarget(
            name: "XLPagerTabStripTests",
            dependencies: ["XLPagerTabStrip"],
            path: "Tests",
            exclude: ["Info.plist"]
        )
    ]
)
