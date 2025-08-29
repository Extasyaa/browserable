#if canImport(Combine)
import Foundation
import Combine

@MainActor
class PublishViewModel: ObservableObject {
    @Published var videoID: String?

    func upload(videoURL: URL) {
        Task {
            do {
                let id = try await YouTubeUploader.shared.upload(videoURL: videoURL, title: "Video Story", description: "")
                videoID = id
            } catch {
                Logger.shared.log("Upload failed: \(error)")
            }
        }
    }
}
#endif
