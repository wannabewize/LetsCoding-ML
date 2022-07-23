import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    TextSentimentView()
                } label: {
                    Text("Text Sentiment")
                }
                
                NavigationLink {
                    TextTokenizerView()
                } label: {
                    Text("Text Tokenizer")
                }
            }
            .navigationTitle("ML API Example")
        }        
    }
}
