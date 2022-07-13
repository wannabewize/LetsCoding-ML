import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("Hello, world!")
                }                

                NavigationButton(title: "Page3", destination: Page2())
                NavigationButton(title: "Page4", destination: Page2())

            }
            .padding()
            .navigationTitle("Lets Coding")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}
