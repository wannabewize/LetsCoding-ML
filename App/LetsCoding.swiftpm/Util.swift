//
//  File 2.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/13.
//

import Foundation
import SwiftUI

struct SomePage: View {
    var body: some View {
        Text("AAA")
    }
}

func makeNavigationLink<T: View>(title: String, page: T) {
    let link : NavigationLink<Text, T> = NavigationLink {
        SomePage()
    } label: {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding()
            .background(Color.gray.opacity(0.25))
            .cornerRadius(8) as! Text
    }

}
