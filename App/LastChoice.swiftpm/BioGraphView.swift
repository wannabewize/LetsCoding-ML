//
//  File.swift
//  마지막 선택
//
//  Created by Jaehoon Lee on 2022/07/21.
//

import SwiftUI
import SwiftUICharts

struct BioGraphView: View {
    @State var chartData: LineChartData = LineChartData(dataSets: LineDataSet(dataPoints: []))
    @State private var selectedCountry: BioModel.Country = .korea
    @State var startYear = 2020
    @State var endYear = 2100
    
    func predictPeriodBioDiversity() -> LineChartData {
        let ret = BioModel.shared.predictBiodiversity(country: selectedCountry.rawValue, start: startYear, end: endYear)
        let data = ret.map { (year, diversity) in
            LineChartDataPoint(value: diversity, xAxisLabel: String(year), description: String(year))
        }
        let values = LineDataSet(dataPoints: data, legendTitle: "종다양성 예측")
        chartData = LineChartData(dataSets: values)
        return chartData
        
    }

    var body: some View {
        VStack {
            GroupBox {
                Stepper("시작 연도 : \(String(startYear))", value: $startYear, in: 2020...2100)
                Stepper("종료 연도 : \(String(endYear))", value: $endYear, in: (startYear+1)...2200)
                HStack {
                    Text("국가")
                    Spacer()
                    Picker("선택하세요", selection: $selectedCountry) {
                        ForEach(BioModel.countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                }
                Button("시작") {
                    predictPeriodBioDiversity()
                }
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(8)
            } label: {
                Text("정보")
            }
        
            GeometryReader { geometry in
                LineChart(chartData: chartData)
                    .yAxisLabels(chartData: chartData)
                    .xAxisLabels(chartData: chartData)
            }
            .padding(.top, 10)

        }
        .padding()
        .navigationTitle("Graph View")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            TemperatureModel.shared.prepareModel()
        }
    }
}
