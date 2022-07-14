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

struct BundleImage: View {
    var fileName: String
    var ext: String
    var body: some View {
        AsyncImage(url: Bundle.main.url(forResource: fileName, withExtension: ext)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            case .failure(let error):
                Text("Error \(error.localizedDescription)")
            @unknown default:
                Text("Unknown Case")
            }
        }
    }
}
