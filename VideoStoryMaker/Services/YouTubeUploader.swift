import Foundation

struct YouTubeUploader {
    static let shared = YouTubeUploader()
    private let apiKey = ProcessInfo.processInfo.environment["YOUTUBE_API_KEY"]

    func upload(videoURL: URL, title: String, description: String) async throws -> String {
        if apiKey == nil {
            Logger.shared.log("YOUTUBE_API_KEY missing, returning placeholder ID")
            return "offline-video-id"
        }
        // Implement YouTube Data API upload via OAuth here
        Logger.shared.log("YouTube upload not implemented, returning placeholder ID")
        return "placeholder-video-id"
    }
}
