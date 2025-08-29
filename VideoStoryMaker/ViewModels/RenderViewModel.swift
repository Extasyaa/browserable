import Foundation
import Combine

@MainActor
final class RenderViewModel: ObservableObject {
    @Published var outputURL: URL?

    func renderVideo(scenes: [StoryScene], audioURL: URL?) {
        Task {
            do {
                let temp = FileManager.default.temporaryDirectory.appendingPathComponent("video.mov")
                _ = try await VideoRenderer().renderVideo(
                    from: scenes,
                    audioURL: audioURL,
                    outputURL: temp,
                    overwrite: true
                )
                outputURL = temp
            } catch {
                Logger.shared.log("Render failed: \(error)")
            }
        }
    }
}