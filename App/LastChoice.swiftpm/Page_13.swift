//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_13: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                비닐봉지 사용을 되도록 줄이기 위해 장바구니를 챙겨 집을 나섰다.

                마트까지 어떻게 가지?
                """)
                AssetImage("bag")
            }
            NavigationButton(title: "직접 자가용을 운전해서 간다.", destination: Page_16())
            NavigationButton(title: "버스타고 간다.", destination: Page_16())
            NavigationButton(title: "걸어간다.", destination: Page_14())
        }
        .padding()
        .navigationTitle("Page-13")
        .navigationBarTitleDisplayMode(.inline)
    }
}

