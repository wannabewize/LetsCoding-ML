//
//  File.swift
//  LetsCoding
//
//  Created by Jaehoon Lee on 2022/07/17.
//

import SwiftUI

struct Page_8: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showPage9: Bool
    
    var body: some View {
        VStack {
            TemperatureGraphView()
            Text("닫기")
                .foregroundColor(.accentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(8)
                .onTapGesture {
                    showPage9 = true
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .padding()
        .navigationTitle("Page-8")
        .navigationBarTitleDisplayMode(.inline)
    }
}
