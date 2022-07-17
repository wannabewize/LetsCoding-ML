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
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure(let error):
                Text("Error \(error.localizedDescription)")
            @unknown default:
                Text("Unknown Case")
            }
        }
    }
}

struct AssetImage: View {
    var name: String
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: geo.size.width / 3, idealWidth: geo.size.width / 2, maxWidth: geo.size.width / 2, minHeight: 200, idealHeight: geo.size.height / 2, maxHeight: 500, alignment: .top)
                    .padding(.top, 100)
                Spacer()
            }
        }
    }
}
