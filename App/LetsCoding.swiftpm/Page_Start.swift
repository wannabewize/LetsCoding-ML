//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/15.
//

import SwiftUI

struct Page_Start: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea(.all, edges: [.bottom, .leading, .trailing])
            
            VStack {
                Text("마지막 선택")
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                Spacer()
                NavigationLink {
                    Page_1()
                } label: {
                    Text("화면을 눌러서 시작하세요.")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 10, x: 5, y: 5)
                }
            }
            .padding(.bottom, 80)
        }
    }
}
