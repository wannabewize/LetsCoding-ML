import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Hello, world!")
            }
            
            
            
            NavigationButton(title: "Page2", destination: Page2())
            NavigationButton(title: "Page3", destination: Page3())
            NavigationButton(title: "Festival", destination: FestivalView())
        }
        .padding()
        .navigationTitle("Lets Coding")
        .navigationBarTitleDisplayMode(.inline)
    }
}
