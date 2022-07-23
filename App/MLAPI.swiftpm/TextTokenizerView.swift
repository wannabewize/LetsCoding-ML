//
//  File.swift
//  MLExercise
//
//  Created by Jaehoon Lee on 2022/07/24.
//

import SwiftUI
import NaturalLanguage

struct TextTokenizerView: View {
    @State var tokens: [String: Int] = [:]
    @State var text = """
        All human beings are born free and equal in dignity and rights.
        They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood.
        """
    
    func doTokenizer() {
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = text
        self.tokens.removeAll()
        
        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { range, attr in

            let token = String(text[range])
            
            if let count = self.tokens[token] {
                self.tokens[token] = count + 1
            }
            else {
                self.tokens[token] = 1
            }
            return true
        }
    }
    
    var body: some View {
        VStack {
            GroupBox {
                Text("Text Tokenizer는 텍스트의 구성 토큰을 분리합니다.").font(.subheadline)
                
                HStack {
                    Button("토큰 분석") {
                        doTokenizer()
                    }
                }.padding(.top, 10)
                
                if tokens.count > 3 {
                    Text("Top 3 토큰").font(.subheadline).padding(.vertical, 4)
                    Text("\(tokens.sorted{$0.1 > $1.1}[0...2].map{ "\($0.key)(\($0.value))" }.joined(separator: ", "))")
                        .font(.body)
                }
            }
            
            TextEditor(text: $text)
                .border(.gray, width: 0.5)
        }
        .padding()
        .navigationTitle("Text Tokenizer")
        .navigationBarTitleDisplayMode(.inline)
    }
}
