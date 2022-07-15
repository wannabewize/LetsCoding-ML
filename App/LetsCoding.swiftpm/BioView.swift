//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/14.
//

import SwiftUI
import CoreML

struct BioView: View {
    @State private var selectedCountry: Country = .korea
    @State private var prediction: Double!
    @State private var selectedYear: Int = 2001
    private var model: MLModel!
    
    init() {
    }
    
    mutating func prepareModel() {        
        if let bundleUrl = Bundle.main.url(forResource: "Biodiversity1", withExtension: "mlmodel"),
           let url = try? MLModel.compileModel(at: bundleUrl) {
            print("reading model file :", url)
            if let diversityModel = try? MLModel(contentsOf: url) {
                self.model = diversityModel
                print("preparing model success", self.model != nil)
            }
            else {
                print("Fail to make model")
            }
        }
        else {
            print("preparing model fail")
        }
    }
    func predict(year: Int, country: String) {
        print("prediction started", country)
        do {
            let provider = try MLDictionaryFeatureProvider(dictionary: ["Year": year, "Country": country])
            let ret = try model.prediction(from: provider)
            let value = ret.featureValue(for: "Value")
//            print("ret :", ret.dictionary["Value"])
            prediction = value?.doubleValue
            print("prediction :", prediction ?? "ERROR")

        }
        catch let error {
            print("Error :", error)
        }
    }
    
    enum Country: String, CaseIterable, Identifiable {
        case china = "China (People's Republic of)"
        case korea = "Korea"
        case france = "France"
        case japan = "Japan"
        
        var id: Self { self }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Picker("국가 선택", selection: $selectedCountry) {
                        Text(Country.korea.rawValue).tag(Country.korea)
                        Text(Country.china.rawValue).tag(Country.china)
                        Text(Country.france.rawValue).tag(Country.france)
                        Text(Country.japan.rawValue).tag(Country.japan)
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
                    predict(year: selectedYear, country: selectedCountry.rawValue)
                }
                .onChange(of: selectedCountry) { newValue in
                    predict(year: selectedYear, country: selectedCountry.rawValue)
                }
                Divider()
                Text("결과 : \(prediction ?? -1)")
            }
        }
        .padding()
        .navigationTitle("Bio Deversity")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
//            self.prepareModel()
        }
    }
}
