//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/14.
//

import SwiftUI

struct MLView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Page3")
                
            }
            NavigationButton(title: "Temperature", destination: TemperatureView())
            NavigationButton(title: "Graph", destination: TemperatureGraphView())
            NavigationButton(title: "BioDiversity", destination: BioView())
        }
        .padding()
        .navigationTitle("Machine Learning")
        .navigationBarTitleDisplayMode(.inline)
    }
}
