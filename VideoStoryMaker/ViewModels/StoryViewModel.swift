import Foundation

@MainActor
class StoryViewModel: ObservableObject {
    @Published var tone: String = "Neutral"
    @Published var prompt: String = ""
    @Published var scenes: [Scene] = []

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
