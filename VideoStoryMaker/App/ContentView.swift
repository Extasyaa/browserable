import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StoryView()
                .tabItem { Label("Story", systemImage: "text.book.closed") }
            ScenesView()
                .tabItem { Label("Scenes", systemImage: "film") }
            MediaView()
                .tabItem { Label("Media", systemImage: "photo") }
            RenderView()
                .tabItem { Label("Render", systemImage: "gearshape") }
            PublishView()
                .tabItem { Label("Publish", systemImage: "paperplane") }
            LogsView()
                .tabItem { Label("Logs", systemImage: "terminal") }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

#Preview {
    ContentView()
}
