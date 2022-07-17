//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_12: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                일회용품 사용도 줄이고 배달 오토바이의 매연도 줄이기 위해 직접 해 먹는게 좋을 것 같다.

                냉장고를 보니 밥 해 먹을 재료가 마땅치 않다. 근처 마트가서 장을 봐야겠다.
                """)
                AssetImage("plate")
            }
            NavigationButton(title: "장바구니를 챙긴다", destination: Page_13())
            NavigationButton(title: "그냥 간다", destination: Page_16())
        }
        .padding()
        .navigationTitle("Page-12")
        .navigationBarTitleDisplayMode(.inline)
    }
}
