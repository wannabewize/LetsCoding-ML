//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_9: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                내가 꾼 꿈이 실제로 일어날 수 있다니… 정말 무섭다. 내가 꿈에서 했던 행동들로 인해 기후가 변화했고, 그로인해 생태계가 파괴되어 지구가 멸망해버릴수가 있구나…. 현실에서는 꼭 생물 다양성을 보호할 수 있는 행동들을 실천해야겠다.

                마침 목이 말라서 카페에 가려고 한다.
                """)
                AssetImage("sun")
            }
            NavigationButton(title: "그냥 간다", destination: Page_10())
            NavigationButton(title: "텀블러를 챙긴다", destination: Page_16())
        }
        .padding()
        .navigationTitle("Page-9")
        .navigationBarTitleDisplayMode(.inline)
    }
}
