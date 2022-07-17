//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/12.
//

import SwiftUI

struct CClass: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                독일의 자동차 회사인 메르세데스-벤츠의 FR/AWD 중형 세단/스테이션 왜건.

                코드네임 W201의 190이 전신이며, 메르세데스-벤츠가 차량 명명체계를 정비하게 되면서 1993년에 출시한 2세대 W202부터 C클래스라는 네임을 사용하고 있으며, 당시 이 세그먼트에서 왕 노릇을 하고 있었던 BMW 3시리즈와 경쟁하기 위해 출시되었다.
                """)
                BundleImage(fileName: "c", ext: "jpg")
            }            
        }
        .padding()
        .navigationTitle("Mercedes - C Class")
        .navigationBarTitleDisplayMode(.inline)        
    }
}
