# Building the iOS App

## Important Note

This is a SwiftUI iOS application. While the Package.swift file is provided for package management support, the primary way to build and run this app is through Xcode.

## Quick Start

### Option 1: Using Xcode (Recommended)

1. **Install Xcode** from the Mac App Store (macOS only)

2. **Create Xcode Project**:
   - Open Xcode
   - File > New > Project
   - Choose "iOS" > "App"
   - Set Product Name: "Viasualisasi"
   - Interface: SwiftUI
   - Language: Swift
   - Click "Next" and save in this directory

3. **Add Source Files**:
   - Drag the `Viasualisasi` folder into your Xcode project
   - Make sure "Copy items if needed" is NOT checked
   - Select your project target

4. **Build and Run**:
   - Select a simulator or device
   - Press Cmd+R

### Option 2: Create Xcode Project from Command Line

```bash
# This creates a basic Xcode project structure
# Note: You'll still need Xcode to build the app
```

## For Package Consumers

If you want to use components from this app in your own iOS project:

```swift
// In your Package.swift
dependencies: [
    .package(url: "https://github.com/yohaneskurniawan91-cyber/Viasualisasi.git", from: "1.0.0")
]
```

## System Requirements

- macOS 13.0 or later
- Xcode 14.0 or later
- iOS 15.0+ (target device or simulator)

## Troubleshooting

**Q: Can I build this without Xcode?**
A: No, iOS apps require Xcode and macOS for building. Swift Package Manager alone cannot build iOS applications.

**Q: Can I run this on Linux or Windows?**
A: No, iOS development requires macOS and Xcode.

**Q: Do I need a paid Apple Developer account?**
A: No, a free Apple ID is sufficient for running apps in the simulator or on your own device for testing.

## Next Steps

Once you have the app running:
1. Explore the three visualization modes
2. Try the interactive controls
3. Check out the source code to understand the SwiftUI patterns
4. Modify and experiment with the visualizations

For more details, see [DOCS_IOS.md](DOCS_IOS.md).
