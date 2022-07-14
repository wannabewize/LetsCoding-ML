//
//  File.swift
//  나의 앱
//
//  Created by wannabewize on 2022/07/10.
//

import Foundation
import CoreML

struct TemperatureModel {
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
    
    static var shared = TemperatureModel()
    
    var monthModel: [String: MLModel] = [:]
        
    mutating func prepareModel() {
        TemperatureModel.monthNames.forEach { month in
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
    
    func predictTemperature(country: String, start: Int, end: Int) -> [(year: Int, temperature: Double)] {
        var results: [(Int, Double)] = []
        (start...end).forEach { year in
            var temperatureSum: Double = 0
            var count = 0
            (0..<12).forEach { monthIndex in
                let month = TemperatureModel.monthNames[monthIndex]
                if let predict = predictTemperature(country: country, year: year, month: month) {
            
                    temperatureSum += predict
                    count += 1
                }
            }
            let averageTemperature = temperatureSum / Double(count)
            print("year: ", year, "average temperature: ", averageTemperature)
            results.append((year: year, temperatrure: averageTemperature))
        }
        return results
    }
}
