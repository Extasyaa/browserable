#if canImport(Combine)
import Foundation
import Combine

@MainActor
class StoryViewModel: ObservableObject {
    @Published var tone: String = "Neutral"
    @Published var prompt: String = ""
    @Published var scenes: [StoryScene] = []

    func generateStory() {
        Task {
            do {
                let result = try await ChatGPTService.shared.generateStory(tone: tone, prompt: prompt)
                scenes = result
            } catch {
                Logger.shared.log("Story generation failed: \(error)")
            }
        }
    }
}
#endif
