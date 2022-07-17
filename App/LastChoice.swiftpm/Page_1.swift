//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/15.
//


import SwiftUI

struct Page_1: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("뜨거운 여름이다. 온 몸이 녹아내일 것만 같다. 카페에 들려서 마실 것을 사야겠다.")
                
                AssetImage("sun")
            }
            NavigationButton(title: "텀블러를 가져간다", destination: Page_15())
            NavigationButton(title: "그냥 간다.", destination: Page_2())
        }
        .padding()
        .navigationTitle("Page-1")
        .navigationBarTitleDisplayMode(.inline)
    }
}
