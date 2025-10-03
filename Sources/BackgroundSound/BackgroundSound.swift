import SwiftUI

@main
struct BackgroundSound: App {
        var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello macOS from VS Code!")
                .font(.largeTitle)
                .padding()
        }
        .frame(minWidth: 300, minHeight: 200)
    }
}