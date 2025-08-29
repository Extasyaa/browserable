import Foundation

class ChatGPTService {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func generateStory(tone: String, prompt: String) async -> Story {
        logger.log("ChatGPTService: generating story")
        let scenes = [
            StoryScene(text: "A cheerful beginning", imageURL: nil),
            StoryScene(text: "An unexpected twist", imageURL: nil)
        ]
        return Story(tone: tone, prompt: prompt, scenes: scenes)
    }
}
