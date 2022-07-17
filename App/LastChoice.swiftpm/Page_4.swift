//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/15.
//

import SwiftUI

struct Page_4: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                20도로 맞추니 시원해졌다. 창문 밖을 보니 그새 비가 눈이 되었다! 한여름에 웬 눈이지? 펭귄까지??! 집 앞에서 영화 찍나보다.

                벌써 시간은 저녁을 먹을 시간이 다 됐다. 오늘은 뭐 먹지?
                """)
                AssetImage("penguin")
            }
            
            NavigationButton(title: "배달시킨다", destination: Page_5())
            NavigationButton(title: "직접 요리한다.", destination: Page_15())
        }
        .padding()
        .navigationTitle("Page-3")
        .navigationBarTitleDisplayMode(.inline)
    }
}
