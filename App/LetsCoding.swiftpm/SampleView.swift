//
//  File.swift
//  LetsCoding
//
//  Created by wannabewize on 2022/07/14.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Lets Coding")
            }
        }
        .padding()
        .navigationTitle("Page-xx")
        .navigationBarTitleDisplayMode(.inline)
    }
}

