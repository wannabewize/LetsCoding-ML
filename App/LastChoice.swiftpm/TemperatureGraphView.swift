//
//  File.swift
//  나의 앱
//
//  Created by Jaehoon Lee on 2022/07/11.
//

import SwiftUI
import SwiftUICharts

struct TemperatureGraphView: View {
    
    @State var selectedCountry = TemperatureModel.countries[12]
    @State var startYear = 2020
    @State var endYear = 2050

    @State var chartData: LineChartData = LineChartData(dataSets: LineDataSet(dataPoints: []))
    
    func predictPeriodTemperature() {
        let temperatures = TemperatureModel.shared.predictTemperature(country: selectedCountry, start: startYear, end: endYear)
        let data = temperatures.map { predict in
            LineChartDataPoint(
                value: predict.temperature,
                xAxisLabel: String(predict.year),
                description: String(predict.year))
        }
        
        let values = LineDataSet(dataPoints: data, legendTitle: "기온 예측")
        
        let chartStyle = LineChartStyle(
            infoBoxPlacement: .header,
            xAxisLabelPosition: .bottom,
            xAxisLabelFont: .system(size: 11),
            xAxisLabelColour: .gray,
            xAxisLabelsFrom: .chartData(rotation: .degrees(0)),
            xAxisTitle: "연도",
            yAxisLabelFont: .system(size: 11),
            yAxisLabelColour: .gray,
            yAxisTitle: "기온"
        )
        let xLabels = (startYear...endYear).filter { year in year % 5 == 0 }.map { year in String(year) }
                        
        chartData = LineChartData(dataSets: values,
                                      metadata: ChartMetadata(title: "기온 예측", subtitle: "\(startYear)-\(endYear)"),
                                      xAxisLabels: xLabels,
                                      chartStyle: chartStyle,
                                      noDataText: Text("데이터 없음"))
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
                        ForEach(TemperatureModel.countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                }
                Button("시작") {
                    predictPeriodTemperature()
                }
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(8)
            } label: {
                Text("정보")
            }
            
            LineChart(chartData: chartData)
                .xAxisLabels(chartData: chartData)
                .yAxisLabels(chartData: chartData, specifier: "%.02f")
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

struct TemperatureGraphView_preview: PreviewProvider {
    static var previews: some View {
        TemperatureGraphView()
    }
}
