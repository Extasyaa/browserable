import Foundation
import Combine

@MainActor
class StoryViewModel: ObservableObject {
    @Published var tone: String = "Neutral"
    @Published var prompt: String = "Write a short story about a hero."

    private let chatGPT: ChatGPTService
    private let logger: Logger
    private let sceneVM: SceneViewModel

    init(logger: Logger, sceneVM: SceneViewModel, chatGPT: ChatGPTService) {
        self.logger = logger
        self.sceneVM = sceneVM
        self.chatGPT = chatGPT
    }

    func generateStory() {
        logger.log("StoryViewModel: generating story")
        Task {
            let story = await chatGPT.generateStory(tone: tone, prompt: prompt)
            sceneVM.scenes = story.scenes
            logger.log("StoryViewModel: received \(story.scenes.count) scenes")
        }
    }
}
