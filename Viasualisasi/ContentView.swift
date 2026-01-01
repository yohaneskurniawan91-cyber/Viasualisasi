import SwiftUI

struct ContentView: View {
    @State private var selectedVisualization: VisualizationType = .chart
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Visualization Type", selection: $selectedVisualization) {
                    ForEach(VisualizationType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                visualizationView
                
                Spacer()
            }
            .navigationTitle("Viasualisasi")
        }
    }
    
    @ViewBuilder
    private var visualizationView: some View {
        switch selectedVisualization {
        case .chart:
            ChartVisualizationView()
        case .graph:
            GraphVisualizationView()
        case .shape:
            ShapeVisualizationView()
        }
    }
}

enum VisualizationType: String, CaseIterable, Identifiable {
    case chart = "Chart"
    case graph = "Graph"
    case shape = "Shape"
    
    var id: String { self.rawValue }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
