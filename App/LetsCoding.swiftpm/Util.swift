//
//  File 2.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/13.
//

import SwiftUI

struct NavigationButton<V: View>: View {
    var title: String
    var destination: V
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(8)
        }

    }
}
