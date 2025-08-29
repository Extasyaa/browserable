import Foundation

@MainActor
class MediaViewModel: ObservableObject {
    @Published var audioURL: URL?
    @Published var scenes: [StoryScene] = []

    func synthesize(for scenes: [StoryScene]) {
        self.scenes = scenes
        Task {
            do {
                let temp = FileManager.default.temporaryDirectory.appendingPathComponent("tts.m4a")
                try await TTSService.shared.synthesize(scenes.map { $0.text }.joined(separator: " "), to: temp)
                audioURL = temp
            } catch {
                Logger.shared.log("TTS failed: \(error)")
            }
        }
    }
}
