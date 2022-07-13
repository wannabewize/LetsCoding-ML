import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("Hello, world!")
                }
                
                NavigationLink(destination: Page2()) {
                    Text("Page2")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(8)
                }

                List {

                    NavigationLink("Page2") {
                        Page2()
                    }
                    NavigationLink("Page3") {
                        
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("Lets Coding")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
