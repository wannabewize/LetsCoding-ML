//
//  File.swift
//  나의 앱
//
//  Created by wannabewize on 2022/07/10.
//

import SwiftUI

struct TemperatureView: View {
    @State var selectedYear = 2000
    @State var selectedMonth = TemperatureModel.monthNames[6]
    @State var selectedCountry = TemperatureModel.countries[12]
    @State var predictedTemperature: Double?
    
    init() {
        TemperatureModel.shared.prepareModel()
    }
    
    func predictTemperature() {
        print("country :", selectedCountry, "year:", selectedYear, "month:", selectedMonth)
        if let predict = TemperatureModel.shared.predictTemperature(country: selectedCountry, year: selectedYear, month: selectedMonth) {
            print("temperature :", predict)
            predictedTemperature = predict
        }
        else {
            print("prediction fail")
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Picker("Country", selection: $selectedCountry) {
                        ForEach(TemperatureModel.countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                    .clipped()
                    
                    Picker("Year", selection: $selectedYear) {
                        ForEach(2020..<2100, id: \.self) { year in
                            Text("\(String(year))").tag(year)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                    .clipped()

                    Picker("Month", selection: $selectedMonth) {
                        ForEach(TemperatureModel.monthNames, id: \.self) { month in
                            Text("\(month)").tag(month)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                    .clipped()
                }
            }
            .onChange(of: selectedCountry) { newValue in
                self.predictTemperature()
            }
            .onChange(of: selectedYear) { newValue in
                self.predictTemperature()
            }
            .onChange(of: selectedMonth) { newValue in
                self.predictTemperature()
            }
            
            Text("예상 온도 : \(predictedTemperature != nil ? String(format: "%2.1f", predictedTemperature!) : "정보 없음")")
            
            Spacer()
        }
        .onAppear {
            self.predictTemperature()
        }
        .navigationTitle("온도 예측")
        .navigationBarTitleDisplayMode(.inline)
    }
}

