//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/15.
//

import SwiftUI

struct Page_2_1_1: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                삐리릭 —
                경쾌한 에어컨 작동음이 들린다. 창 밖을 보니 갑자기 비가 온다. 바닥에는 온갖 새들이 죽어있다. 왜 이렇게 불길하지?

                그나저나 에어컨을 틀었는데 아직도 덥다. 헉! 에어컨 온도가 28도로 설정되어있다!! 뜨거운 바람은 용납할 수 없다. 온도를 내려야겠다. 몇 도로 맞출까?
                """)
                
                // 플레이그라운드에서 이미지(jpg)를 추가한 경우
//                Image("page_img_2_2_1")

            }
        }
        .padding()
        .navigationTitle("Sample Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}
