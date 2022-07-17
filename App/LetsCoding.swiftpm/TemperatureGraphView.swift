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
    @State var endYear = 2100

    enum Target:String{
        case All, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    }
    
    @State var values = LineDataSet(dataPoints: [])
    
    func predictPeriodTemperature() {
        let temperatures = TemperatureModel.shared.predictTemperature(country: selectedCountry, start: startYear, end: endYear)
        let data = temperatures.map { predict in
            LineChartDataPoint(value: predict.temperature, xAxisLabel: String(predict.year))
        }
        values = LineDataSet(dataPoints: data, legendTitle: "기온 예측")
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
                LineChart(chartData: LineChartData(dataSets: values))
                    .yAxisLabels(chartData: LineChartData(dataSets: values))
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
