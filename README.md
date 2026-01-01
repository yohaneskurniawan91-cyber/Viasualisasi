# Viasualisasi

An iOS visualization application built with SwiftUI, featuring interactive charts, graphs, and shape visualizations.

## Features

- **Chart Visualization**: Interactive bar charts with randomizable data
- **Graph Visualization**: Animated line graphs with smooth transitions
- **Shape Visualization**: Customizable geometric shapes with rotation and scaling
- Modern SwiftUI interface with iOS 15+ support

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.9+

## Installation

### Using Xcode

1. Clone the repository:
```bash
git clone https://github.com/yohaneskurniawan91-cyber/Viasualisasi.git
cd Viasualisasi
```

2. Open the project in Xcode:
```bash
open Viasualisasi.xcodeproj
```
*(Note: If you don't have an Xcode project file yet, you can create one by opening the Package.swift file in Xcode)*

3. Select your target device or simulator
4. Press `Cmd + R` to build and run

### Using Swift Package Manager

Add the package dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yohaneskurniawan91-cyber/Viasualisasi.git", from: "1.0.0")
]
```

## Project Structure

```
Viasualisasi/
├── Viasualisasi/
│   ├── VisualisasiApp.swift        # Main app entry point
│   ├── ContentView.swift           # Main content view with navigation
│   ├── Views/
│   │   ├── ChartVisualizationView.swift    # Bar chart implementation
│   │   ├── GraphVisualizationView.swift    # Line graph implementation
│   │   └── ShapeVisualizationView.swift    # Shape transformations
│   ├── Assets.xcassets/            # App icons and assets
│   └── Info.plist                  # App configuration
├── Package.swift                    # Swift Package Manager configuration
└── README.md
```

## Usage

The app provides three main visualization modes accessible via a segmented control:

1. **Chart**: Displays bar charts with sample data that can be randomized
2. **Graph**: Shows animated line graphs with smooth transitions
3. **Shape**: Offers interactive shape transformations (rotation and scaling)

## Building from Source

```bash
# Clone the repository
git clone https://github.com/yohaneskurniawan91-cyber/Viasualisasi.git

# Navigate to the project directory
cd Viasualisasi

# Open in Xcode (macOS only)
open Viasualisasi.xcodeproj

# Or build using xcodebuild
xcodebuild -scheme Viasualisasi -destination 'platform=iOS Simulator,name=iPhone 15' build
```

## License

MIT License - feel free to use this project for learning and development.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.