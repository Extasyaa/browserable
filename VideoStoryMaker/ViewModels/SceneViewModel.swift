import Foundation
import Combine

@MainActor
final class SceneViewModel: ObservableObject {
    @Published var scenes: [StoryScene] = []

    func load(from scenes: [StoryScene]) {
        self.scenes = scenes
    }

    func generateImages() {
        Task {
            for index in scenes.indices {
                do {
                    if let data = try await GrokImageService.shared.generateImage(for: scenes[index]) {
                        scenes[index].imageData = data
                    }
                } catch {
                    Logger.shared.log("Image generation failed: \(error)")
                }
            }
        }
    }
}