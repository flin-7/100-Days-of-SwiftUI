import SwiftUI
import PlaygroundSupport

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Day 24")
        .titleStyle()
    }
}

let host = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = host
