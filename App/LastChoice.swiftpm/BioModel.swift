//
//  File.swift
//  마지막 선택
//
//  Created by Jaehoon Lee on 2022/07/21.
//

import Foundation
import CoreML

struct BioModel {
    static var shared = BioModel()
    private var model: MLModel!
    
    mutating func prepareModel() {
        if let bundleUrl = Bundle.main.url(forResource: "Biodiversity1", withExtension: "mlmodel"),
           let url = try? MLModel.compileModel(at: bundleUrl) {
            print("reading model file :", url)
            if let diversityModel = try? MLModel(contentsOf: url) {
//                model = diversityModel
                print("preparing model success", diversityModel != nil)
                self.model = diversityModel
            }
            else {
                print("Fail to make model")
            }
        }
        else {
            print("preparing model fail")
        }
    }
    
    func predict(country: String, year: Int) -> Double? {
        print("prediction started", country)
        do {
            let provider = try MLDictionaryFeatureProvider(dictionary: ["Year": year, "Country": country])
            let ret = try model.prediction(from: provider)
            let value = ret.featureValue(for: "Value")
//            print("ret :", ret.dictionary["Value"])
            let prediction = value?.doubleValue
            print("prediction :", prediction ?? "ERROR")
            return prediction

        }
        catch {
            print("Error :", error)
            return nil
        }
    }
    
    func predictBiodiversity(country: String, start: Int, end: Int) -> [(year: Int, biodiversity: Double)]{
        
        var results: [(Int, Double)] = []
        (start...end).forEach { year in
            if let predict = predict(country: country, year: year) {
                results.append((year: year, biodiversity: predict))
            }            
        }
        return results
    }
    
    static let countries = [
        "Korea",
        "France",
        "Japan",
        "China (People's Republic of)"
    ]
    
    enum Country: String, CaseIterable, Identifiable {
        case china = "China (People's Republic of)"
        case korea = "Korea"
        case france = "France"
        case japan = "Japan"
        
        var id: Self { self }
    }
}
