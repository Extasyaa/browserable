import Foundation

class VideoRenderer {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func renderVideo(from scenes: [StoryScene]) async -> URL {
        logger.log("VideoRenderer: rendering video")
        return URL(fileURLWithPath: "/tmp/video.mp4")
    }
}
