import Foundation

class TTSService {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func generateVoice(for scenes: [StoryScene]) async {
        logger.log("TTSService: generating voice for \(scenes.count) scenes")
    }
}
