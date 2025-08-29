import Foundation

@MainActor
class SceneViewModel: ObservableObject {
    @Published var scenes: [Scene] = []

    func load(from scenes: [Scene]) {
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
