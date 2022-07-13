//
//  File.swift
//  나의 앱
//
//  Created by wannabewize on 2022/07/10.
//

import Foundation
import CoreML

struct FestivalModel {
    static let countries =
    [
        "Argentina",
        "Brazil",
        "Canada",
        "China",
        "France",
        "Germany",
        "Indonesia",
        "Italy",
        "Japan",
        "Mexico",
        "Saudi Arabia",
        "South Africa",
        "South Korea",
        "Turkey",
        "United Kingdom",
        "United States"
    ]
    
    static let monthNames = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ]
    
    static var shared = FestivalModel()
    
    var monthModel: [String: MLModel] = [:]
        
    mutating func prepareModel() {
        FestivalModel.monthNames.forEach { month in
            if let bundleUrl = Bundle.main.url(forResource: month, withExtension: "mlmodel"),
               let url = try? MLModel.compileModel(at: bundleUrl) {
                
                if let model = try? MLModel(contentsOf: url) {
                    self.monthModel[month] = model
                }
            }
        }
        
        print("monthModel initialized:", monthModel)
    }
    
    func predictTemperature(country: String, year: Int, month: String) -> Double? {
        if let model = self.monthModel[month] {
            print("model for month found")
            
            do {
                let inputs: [String: Any] = ["Country": country, "Year": Double(year)]
                let provider = try MLDictionaryFeatureProvider(dictionary: inputs)
                let output = try model.prediction(from: provider)
                let ret = output.featureValue(for: "AverageTemperature")
//                print("output :", ret)                
                return ret?.doubleValue
            }
            catch {
                print("Error :", error)
                return nil
            }
        }
        else {
            print("can not find model for month")
            return nil
        }
    }
}
