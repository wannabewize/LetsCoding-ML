//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/12.
//

import SwiftUI

struct Page2: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Page2")
            }
            NavigationButton(title: "Graph", destination: GraphView())
        }
        .padding()
        .navigationTitle("Page2")
        .navigationBarTitleDisplayMode(.inline)        
    }
}
