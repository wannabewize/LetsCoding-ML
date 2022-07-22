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

    enum Target:String{
        case All, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    }
    
    @State var chartData: LineChartData = LineChartData(dataSets: LineDataSet(dataPoints: []))
    
    
    func predictPeriodTemperature() -> LineChartData {
        let temperatures = TemperatureModel.shared.predictTemperature(country: selectedCountry, start: startYear, end: endYear)
        let data = temperatures.map { predict in
            LineChartDataPoint(value: predict.temperature, xAxisLabel: String(predict.year), description: String(predict.year))
        }
        let values = LineDataSet(dataPoints: data, legendTitle: "기온 예측")
        
        let chartStyle = LineChartStyle(
            infoBoxPlacement: .header,
//            infoBoxContentAlignment: <#T##InfoBoxAlignment#>, infoBoxValueFont: <#T##Font#>, infoBoxValueColour: <#T##Color#>, infoBoxDescriptionFont: <#T##Font#>, infoBoxDescriptionColour: <#T##Color#>, infoBoxBackgroundColour: <#T##Color#>, infoBoxBorderColour: <#T##Color#>, infoBoxBorderStyle: <#T##StrokeStyle#>, markerType: <#T##LineMarkerType#>, xAxisGridStyle: <#T##GridStyle#>, xAxisLabelPosition: <#T##XAxisLabelPosistion#>, xAxisLabelFont: <#T##Font#>, xAxisLabelColour: <#T##Color#>,
            xAxisLabelsFrom: .chartData(rotation: .degrees(0)),
            xAxisTitle: "연도"
//            xAxisTitleFont: <#T##Font#>, xAxisTitleColour: <#T##Color#>, xAxisBorderColour: <#T##Color?#>, yAxisGridStyle: <#T##GridStyle#>, yAxisLabelPosition: <#T##YAxisLabelPosistion#>, yAxisLabelFont: <#T##Font#>, yAxisLabelColour: <#T##Color#>,
//            yAxisNumberOfLabels: 5
//            yAxisLabelType: <#T##YAxisLabelType#>, yAxisTitle: <#T##String?#>, yAxisTitleFont: <#T##Font#>, yAxisTitleColour: <#T##Color#>, yAxisBorderColour: <#T##Color?#>, baseline: <#T##Baseline#>, topLine: <#T##Topline#>, globalAnimation: <#T##Animation#>
        )
        let xLabels = (startYear...endYear).filter { year in year % 10 == 0 }.map { year in String(year) }
        let aaa = temperatures.map { (year, temperature) in temperature }
        let max = aaa.max()!
        let min = aaa.min()!
        print("min:", min, "max:", max)
        chartData = LineChartData(dataSets: values,
                                      metadata: ChartMetadata(title: "기온 예측", subtitle: "\(startYear)-\(endYear)"),
                                      xAxisLabels: xLabels,
                                      yAxisLabels: [String(min), String(max)],
                                      chartStyle: chartStyle,
                                      noDataText: Text("데이터 없음"))
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

struct TemperatureGraphView_preview: PreviewProvider {
    static var previews: some View {
        TemperatureGraphView()
    }
}
