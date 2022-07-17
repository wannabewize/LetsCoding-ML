//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_6: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                분리수거 하기도 귀찮고 음식물도 어차피 묻었을 것 같으니 다 일반쓰레기에 버렸다.

                그 순간 창문 위로 물이 차오른다. 영화찍는게 아니었나..?! 물이 창문을 깨부수고 왈칵 들어왔고 집 안은 순식간에 아수라장이 되었다. 나는 수영도 못하는데! 헤엄치지도 못해 밖을 나갈 수가 없다. 난 그대로 익사했…….
                """)
                
                AssetImage("wave")
            }
            NavigationButton(title: "다음", destination: Page_7())
        }
        .padding()
        .navigationTitle("Page-6")
        .navigationBarTitleDisplayMode(.inline)
    }
}
