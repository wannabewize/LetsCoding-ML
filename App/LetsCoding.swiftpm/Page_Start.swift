//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/15.
//

import SwiftUI

struct Page_Start: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Text("마지막 선택")
                .fontWeight(.heavy)
            GeometryReader { geometry in
                BundleImage(fileName: "cover", ext: "png")
                    .frame(width: geometry.size.width, alignment: .bottom)
            .ignoresSafeArea(.container, edges: [.bottom, .leading, .trailing])
            }

        }
        .background(Color.blue)

        .navigationTitle("Sample Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}
