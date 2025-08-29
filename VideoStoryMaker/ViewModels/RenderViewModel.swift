import Foundation

@MainActor
class RenderViewModel: ObservableObject {
    @Published var outputURL: URL?

    func renderVideo(scenes: [Scene], audioURL: URL?) {
        Task {
            do {
                let temp = FileManager.default.temporaryDirectory.appendingPathComponent("video.mov")
                _ = try await VideoRenderer().renderVideo(from: scenes, audioURL: audioURL, outputURL: temp, overwrite: true)
                outputURL = temp
            } catch {
                Logger.shared.log("Render failed: \(error)")
            }
        }
    }
}
