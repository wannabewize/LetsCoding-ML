//
//  File.swift
//  MLExercise
//
//  Created by Jaehoon Lee on 2022/07/24.
//

import SwiftUI
import NaturalLanguage

struct TextSentimentView: View {
    @State var sentiment: Double = 999
    @State var text = "It's great!"
    
    func doTextSentiment() {
        let tagger = NLTagger(tagSchemes: [.sentimentScore, .tokenType])
        tagger.string = text
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph, scheme: .sentimentScore, options: []) { sentiment, range in
            if let sentiment = sentiment {
                print(sentiment.rawValue)
                self.sentiment = Double(sentiment.rawValue)!
            }
            return false
        }
    }
    
    var body: some View {
        VStack {
            GroupBox {
                Text("TextSentiment는 텍스트의 내용의 긍정적(1)인지 부정적(-1)인지 판단합니다.").font(.subheadline)
                
                HStack {
                    Text("값 : \(sentiment)")
                    Button("평가하기") {
                        doTextSentiment()
                    }
                }.padding(.top, 10)
            }

            TextEditor(text: $text)
                .border(.gray, width: 0.5)
            
        }
        .padding()
        .navigationTitle("Text Sentiment")
        .navigationBarTitleDisplayMode(.inline)
    }
}
