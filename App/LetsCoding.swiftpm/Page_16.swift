//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_16: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                앗! 잘못된 선택지를 골랐다.

                환경을 생각하는 선택지를 골라보자.
                """)
                AssetImage("leaf")
            }
            NavigationButton(title: "꿈에서 깼을 때로 돌아가기", destination: Page_9())
            
        }
        .padding()
        .navigationTitle("Page-16")
        .navigationBarTitleDisplayMode(.inline)
    }
}
