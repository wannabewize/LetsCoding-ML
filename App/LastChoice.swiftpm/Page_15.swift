//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_15: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ScrollView {
                Text("앗 잘못된 선택지를 골랐다.")
                AssetImage("arrow")
            }
            
            NavigationButton(title: "처음으로 돌아가기", destination: ContentView())
        }
        .padding()
        .navigationTitle("Sample Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}
