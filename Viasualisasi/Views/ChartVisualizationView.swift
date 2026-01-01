import SwiftUI
import Charts

struct ChartVisualizationView: View {
    @State private var dataPoints: [DataPoint] = DataPoint.sampleData
    
    var body: some View {
        VStack {
            Text("Bar Chart Visualization")
                .font(.headline)
                .padding()
            
            if #available(iOS 16.0, *) {
                Chart(dataPoints) { point in
                    BarMark(
                        x: .value("Category", point.category),
                        y: .value("Value", point.value)
                    )
                    .foregroundStyle(Color.blue.gradient)
                }
                .frame(height: 300)
                .padding()
            } else {
                // Fallback for iOS 15 and earlier
                LegacyChartView(dataPoints: dataPoints)
                    .frame(height: 300)
                    .padding()
            }
            
            Button("Randomize Data") {
                withAnimation {
                    dataPoints = DataPoint.randomData()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct DataPoint: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
    
    static let sampleData: [DataPoint] = [
        DataPoint(category: "A", value: 10),
        DataPoint(category: "B", value: 25),
        DataPoint(category: "C", value: 15),
        DataPoint(category: "D", value: 30),
        DataPoint(category: "E", value: 20)
    ]
    
    static func randomData() -> [DataPoint] {
        let categories = ["A", "B", "C", "D", "E"]
        return categories.map { category in
            DataPoint(category: category, value: Double.random(in: 5...35))
        }
    }
}

// Legacy chart view for iOS 15 and earlier
struct LegacyChartView: View {
    let dataPoints: [DataPoint]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(dataPoints) { point in
                    VStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 40, height: CGFloat(point.value) * 5)
                        
                        Text(point.category)
                            .font(.caption)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ChartVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        ChartVisualizationView()
    }
}
