import SwiftUI

@main
struct VideoStoryMakerApp: App {
    @StateObject private var logger: Logger
    @StateObject private var sceneVM: SceneViewModel
    @StateObject private var storyVM: StoryViewModel
    @StateObject private var mediaVM: MediaViewModel
    @StateObject private var renderVM: RenderViewModel
    @StateObject private var publishVM: PublishViewModel
    @StateObject private var logVM: LogViewModel

    init() {
        let logger = Logger()
        _logger = StateObject(wrappedValue: logger)

        let sceneVM = SceneViewModel()
        _sceneVM = StateObject(wrappedValue: sceneVM)

        let chatGPT = ChatGPTService(logger: logger)
        let storyVM = StoryViewModel(logger: logger, sceneVM: sceneVM, chatGPT: chatGPT)
        _storyVM = StateObject(wrappedValue: storyVM)

        let tts = TTSService(logger: logger)
        let mediaVM = MediaViewModel(sceneVM: sceneVM, logger: logger, tts: tts)
        _mediaVM = StateObject(wrappedValue: mediaVM)

        let renderer = VideoRenderer(logger: logger)
        let renderVM = RenderViewModel(sceneVM: sceneVM, renderer: renderer, logger: logger)
        _renderVM = StateObject(wrappedValue: renderVM)

        let uploader = YouTubeUploader(logger: logger)
        let publishVM = PublishViewModel(renderVM: renderVM, uploader: uploader, logger: logger)
        _publishVM = StateObject(wrappedValue: publishVM)

        let logVM = LogViewModel(logger: logger)
        _logVM = StateObject(wrappedValue: logVM)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(logger)
                .environmentObject(sceneVM)
                .environmentObject(storyVM)
                .environmentObject(mediaVM)
                .environmentObject(renderVM)
                .environmentObject(publishVM)
                .environmentObject(logVM)
        }
    }
}
