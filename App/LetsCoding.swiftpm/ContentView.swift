import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Playground, SwiftUI!")
            }
            
            NavigationButton(title: "Mercedes", destination: CClass())
            NavigationButton(title: "Machine Learning", destination: MLView())
            NavigationButton(title: "Page3", destination: Page3())
        }
        .padding()
        .navigationTitle("Lets Coding")
        .navigationBarTitleDisplayMode(.inline)
    }
}
