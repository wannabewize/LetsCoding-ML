//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_7: View {
    @State var showMLPage = false
    @State var showPage9 = false
    var body: some View {
        VStack {
            ScrollView {
                Text("""
                난 그대로 익사했……. 는줄 알았는데 꿈이었다. 내가 죽은 줄만 알았는데… 너무 생생했다. 이런 일이 정말 일어날 수 있는지 알아봐야겠다.
                """)
                AssetImage("death")
            }
                        
            Text("머신러닝 보러가기")
                .foregroundColor(.accentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(8)
                .onTapGesture(perform: {
                   showMLPage = true
                })
                .fullScreenCover(isPresented: $showMLPage) {
                    Page_8(showPage9: $showPage9)
                }
            // 모달이 닫히면 Page_9으로 이동
            NavigationLink("다음", isActive: $showPage9) {
                Page_9()
            }.hidden()
        }
        .padding()
        .navigationTitle("Page-7")
        .navigationBarTitleDisplayMode(.inline)
    }
}
