import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StoryView()
                .tabItem { Text("Story") }
            ScenesView()
                .tabItem { Text("Scenes") }
            MediaView()
                .tabItem { Text("Media") }
            RenderView()
                .tabItem { Text("Render") }
            PublishView()
                .tabItem { Text("Publish") }
            LogsView()
                .tabItem { Text("Logs") }
        }
    }
}
