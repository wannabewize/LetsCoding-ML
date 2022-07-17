//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_10: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                일회용품을 덜 쓰기 위해 텀블러를 챙겨가야겠다.

                카페에 들어서니 벌써부터 찬 공기가 느껴진다. 아무래도 에어컨 온도가 20도로 설정되어있어보인다.
                """)
                
                NavigationButton(title: "에어컨 온도를 25도로 올려달라고 한다", destination: Page_11())
                NavigationButton(title: "에어컨 온도를 18도로 낮춰달라고 한다", destination: Page_16())
            }
        }
        .padding()
        .navigationTitle("Page-10")
        .navigationBarTitleDisplayMode(.inline)
    }
}
