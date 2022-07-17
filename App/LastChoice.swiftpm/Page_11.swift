//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_11: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                아무리 더워도 과한 에너지 사용은 하면 안 된다. 카페 직원에게 가서 에어컨 온도를 25도까지 높여달라고 말했다.

                카페에서 음료를 챙기고 집에 도착하니 벌써 밥 먹을 시간이 됐다. 오늘은 뭐 먹지?
                """)
                
                AssetImage("wind-weak")
            }
            NavigationButton(title: "배달시켜 먹는다.", destination: Page_16())
            NavigationButton(title: "직접 해 먹는다.", destination: Page_12())
        }
        .padding()
        .navigationTitle("Page-11")
        .navigationBarTitleDisplayMode(.inline)
    }
}
