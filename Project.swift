import ProjectDescription

let iOSAppTarget = Target(
    name: "iOSApp",
    platform: .iOS,
    product: .app,
    productName: "iOSApp",
    bundleId: "com.test.iOS",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]) ,
    infoPlist: "App/SupportingFiles/Info.plist",
    sources: [
        "App/Sources/**/*.swift",
    ],
    resources: ["App/Resources/**/*"],
    dependencies: [
        .target(name: "watchOSApp"),
        .target(name: "Framework_ios")
    ]
)

let watchOSAppTarget = Target(
    name: "watchOSApp",
    platform: .watchOS,
    product: .app,
    bundleId: "com.test.iOS.watchkitapp",
    deploymentTarget: .watchOS(targetVersion: "9.0"),
    infoPlist: "App/Extensions/watchOS/SupportingFiles/Info.plist",
    sources: [
        "App/Extensions/watchOS/Sources/**/*.swift"
    ],
    resources: [
        "App/Extensions/watchOS/Resources/**/*"
    ],
    dependencies: [
        .target(name: "Framework_watchos")
    ]
)

let frameworkTargetiOS = Target(
    name: "Framework_ios",
    platform: .iOS,
    product: .framework,
    productName: "Framework",
    bundleId: "com.test.framework",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.ipad, .iphone]),
    sources: [
        "Framework/Sources/**/*.swift"
    ]
)

let frameworkTargetwatchOS = Target(
    name: "Framework_watchos",
    platform: .watchOS,
    product: .framework,
    productName: "Framework",
    bundleId: "com.test.framework",
    deploymentTarget: .watchOS(targetVersion: "9.0"),
    sources: [
        "Framework/Sources/**/*.swift"
    ]
)

let frameworkiOSUnitTestTarget = Target(
    name: "FrameworkTests_ios",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.test.framework.tests",
    sources: ["Framework/Tests/**/*.swift"],
    dependencies: [
        .target(name: "Framework_ios"),
        .target(name: "iOSApp")
    ]
)

let frameworkWatchOSUnitTestTarget = Target(
    name: "FrameworkTests_watchos",
    platform: .watchOS,
    product: .unitTests,
    bundleId: "com.test.framework.tests",
    sources: ["Framework/Tests/**/*.swift"],
    dependencies: [
        .target(name: "Framework_watchos"),
         .target(name: "watchOSApp") // this does not work !
    ]
)

let project = Project(
    name: "Project",
    targets: [
        iOSAppTarget, 
        watchOSAppTarget,
        frameworkTargetiOS,
        frameworkiOSUnitTestTarget,
        frameworkTargetwatchOS,
        frameworkWatchOSUnitTestTarget
    ]
)