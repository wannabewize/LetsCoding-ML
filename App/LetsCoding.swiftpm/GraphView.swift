//
//  File.swift
//  나의 앱
//
//  Created by Jaehoon Lee on 2022/07/11.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    
    enum Countries:String{
        case Argentina, Australia, Brazil, Canada, China, France, Germany, India, Indonesia, Italy, Japan,  Mexico, Russia, Turkey
        case South_Korea = "South Korea"
        case Saudi_Arabia = "Saudi Arabia"
        case South_Africa = "South Africa"
        case United_Kingdom = "United Kingdom"
        case United_States = "United States"
    }

    enum Target:String{
        case All, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    }
    
    let values = LineDataSet(dataPoints: [
        LineChartDataPoint(value: 1),
        LineChartDataPoint(value: 2),
        LineChartDataPoint(value: 3),
        LineChartDataPoint(value: 4),
        LineChartDataPoint(value: 5),
        LineChartDataPoint(value: 6),
        LineChartDataPoint(value: 7),
        LineChartDataPoint(value: 8),
        LineChartDataPoint(value: 9)
    ])
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
//                Path { path in
//                    path.move(to: CGPoint(x: 100, y: 100))
//                    path.addLines([
//                        CGPoint(x: 200, y: 100),
//                        CGPoint(x: 200, y: 200),
//                        CGPoint(x: 100, y: 200),
//                        CGPoint(x: 100, y: 100)
//                    ])
//                }
//                .stroke(style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 5))
                
                LineChart(chartData: LineChartData(dataSets: values)
                )
            }
        }
        .navigationTitle("Graph View")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct GraphView_Preview: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
