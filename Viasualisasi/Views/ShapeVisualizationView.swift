import SwiftUI

struct ShapeVisualizationView: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    @State private var selectedShape: ShapeType = .circle
    
    var body: some View {
        VStack {
            Text("Shape Visualization")
                .font(.headline)
                .padding()
            
            Picker("Shape", selection: $selectedShape) {
                ForEach(ShapeType.allCases) { shape in
                    Text(shape.rawValue).tag(shape)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ZStack {
                shapeView
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: selectedShape)
            }
            .frame(height: 300)
            .padding()
            
            VStack(spacing: 20) {
                HStack {
                    Text("Rotation")
                    Slider(value: $rotation, in: 0...360)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Scale")
                    Slider(value: $scale, in: 0.5...2.0)
                }
                .padding(.horizontal)
                
                Button("Reset") {
                    withAnimation {
                        rotation = 0
                        scale = 1
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private var shapeView: some Shape {
        switch selectedShape {
        case .circle:
            Circle()
        case .square:
            Rectangle()
        case .triangle:
            Triangle()
        case .star:
            Star()
        }
    }
}

enum ShapeType: String, CaseIterable, Identifiable {
    case circle = "Circle"
    case square = "Square"
    case triangle = "Triangle"
    case star = "Star"
    
    var id: String { self.rawValue }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

struct Star: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * 0.4
        let numberOfPoints = 5
        
        var path = Path()
        
        for i in 0..<numberOfPoints * 2 {
            let angle = CGFloat(i) * .pi / CGFloat(numberOfPoints) - .pi / 2
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.closeSubpath()
        return path
    }
}

struct ShapeVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeVisualizationView()
    }
}
