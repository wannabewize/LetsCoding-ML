//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_7: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                난 그대로 익사했……. 는줄 알았는데 꿈이었다. 내가 죽은 줄만 알았는데… 너무 생생했다. 이런 일이 정말 일어날 수 있는지 알아봐야겠다.
                """)
                AssetImage("death")
            }
            
            NavigationButton(title: "머신러닝 보러가기", destination: MLView())
            
        }
        .padding()
        .navigationTitle("Page-7")
        .navigationBarTitleDisplayMode(.inline)
    }
}
