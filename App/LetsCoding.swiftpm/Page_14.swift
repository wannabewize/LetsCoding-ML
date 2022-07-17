//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_14: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                마트까지 걸어가면 운동도 하고 자동차 매연도 줄이는 일석이조지!

                마트에서 장보고 집에 와서 직접 요리를 하니 평소보다 건강해진 기분이었다.

                일상생활에서 이렇게 의식적으로 행동해보니 괜찮은 것 같다. 앞으로도 환경을 생각하며 생활해야겠다.
                """)
                
                AssetImage("walk")
                
            }
        }
        .padding()
        .navigationTitle("Page-xx")
        .navigationBarTitleDisplayMode(.inline)
    }
}
