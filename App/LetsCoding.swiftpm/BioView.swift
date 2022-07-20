//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/14.
//

import SwiftUI
import CoreML

struct BioView: View {
    @State private var selectedCountry: BioModel.Country = .korea
    @State private var prediction: Double!
    @State private var selectedYear: Int = 2001
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Picker("국가 선택", selection: $selectedCountry) {
                        Text(BioModel.Country.korea.rawValue).tag(BioModel.Country.korea)
                        Text(BioModel.Country.china.rawValue).tag(BioModel.Country.china)
                        Text(BioModel.Country.france.rawValue).tag(BioModel.Country.france)
                        Text(BioModel.Country.japan.rawValue).tag(BioModel.Country.japan)
                    }
                    .pickerStyle(.wheel)
                    
                    Picker("연도", selection: $selectedYear) {
                        ForEach(2001..<2030) { year in
                            Text("\(String(year))").tag(year)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .onChange(of: selectedYear) { newValue in
                    BioModel.shared.predict(country: selectedCountry.rawValue, year: selectedYear)
                }
                .onChange(of: selectedCountry) { newValue in
                    BioModel.shared.predict(country: selectedCountry.rawValue, year: selectedYear)
                }
                Divider()
                Text("결과 : \(prediction ?? -1)")
            }
        }
        .padding()
        .navigationTitle("Bio Deversity")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            BioModel.shared.prepareModel()
        }
    }
}
