import Foundation
import Combine

@MainActor
class MediaViewModel: ObservableObject {
    @Published var scenes: [StoryScene] = []
    private var cancellables = Set<AnyCancellable>()
    private let logger: Logger
    private let tts: TTSService

    init(sceneVM: SceneViewModel, logger: Logger, tts: TTSService) {
        self.logger = logger
        self.tts = tts
        sceneVM.$scenes
            .sink { [weak self] in self?.scenes = $0 }
            .store(in: &cancellables)
    }

    func generateVoice() {
        logger.log("MediaViewModel: generating voice")
        Task {
            await tts.generateVoice(for: scenes)
        }
    }
}
