import SwiftUI

@main
struct VideoStoryMakerApp: App {
    @StateObject private var storyVM = StoryViewModel()
    @StateObject private var sceneVM = SceneViewModel()
    @StateObject private var mediaVM = MediaViewModel()
    @StateObject private var renderVM = RenderViewModel()
    @StateObject private var publishVM = PublishViewModel()
    @StateObject private var logVM = LogViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storyVM)
                .environmentObject(sceneVM)
                .environmentObject(mediaVM)
                .environmentObject(renderVM)
                .environmentObject(publishVM)
                .environmentObject(logVM)
        }
    }
}
