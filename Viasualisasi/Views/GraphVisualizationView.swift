import SwiftUI

struct GraphVisualizationView: View {
    @State private var points: [CGPoint] = []
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Line Graph Visualization")
                .font(.headline)
                .padding()
            
            Canvas { context, size in
                // Draw axes
                context.stroke(
                    Path { path in
                        path.move(to: CGPoint(x: 30, y: 0))
                        path.addLine(to: CGPoint(x: 30, y: size.height - 30))
                        path.addLine(to: CGPoint(x: size.width, y: size.height - 30))
                    },
                    with: .color(.gray),
                    lineWidth: 2
                )
                
                // Draw line graph
                if points.count >= 2 {
                    let path = Path { path in
                        path.move(to: points[0])
                        for point in points.dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    
                    context.stroke(
                        path.trimmedPath(from: 0, to: animationProgress),
                        with: .color(.blue),
                        lineWidth: 3
                    )
                    
                    // Draw points
                    for point in points {
                        context.fill(
                            Circle().path(in: CGRect(x: point.x - 4, y: point.y - 4, width: 8, height: 8)),
                            with: .color(.blue)
                        )
                    }
                }
            }
            .frame(height: 300)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
            
            Button("Generate New Graph") {
                generatePoints()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onAppear {
            generatePoints()
        }
    }
    
    private func generatePoints() {
        let newPoints = (0..<10).map { i in
            CGPoint(
                x: 50 + CGFloat(i) * 30,
                y: 50 + CGFloat.random(in: 50...200)
            )
        }
        
        withAnimation(.easeInOut(duration: 1.5)) {
            points = newPoints
            animationProgress = 0
        }
        
        withAnimation(.easeInOut(duration: 1.5).delay(0.1)) {
            animationProgress = 1
        }
    }
}

struct GraphVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        GraphVisualizationView()
    }
}
