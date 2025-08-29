import Foundation

class YouTubeUploader {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func uploadVideo(at url: URL) async -> String {
        logger.log("YouTubeUploader: uploading video at \(url.path)")
        return "video-id-123"
    }
}
