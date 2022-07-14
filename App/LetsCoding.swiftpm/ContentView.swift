import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Playground, SwiftUI!")
            }
            
            NavigationButton(title: "Mercedes", destination: CClass())
            NavigationButton(title: "Machine Learning", destination: MLView())
            NavigationButton(title: "Bio Diversity", destination: BioView())
            NavigationButton(title: "Sample Page", destination: SampleView())
        }
        .padding()
        .navigationTitle("Lets Coding")
        .navigationBarTitleDisplayMode(.inline)
    }
}
