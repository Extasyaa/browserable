import Foundation
import Combine

@MainActor
class RenderViewModel: ObservableObject {
    @Published var outputPath: String = ""
    private let sceneVM: SceneViewModel
    private let renderer: VideoRenderer
    private let logger: Logger

    init(sceneVM: SceneViewModel, renderer: VideoRenderer, logger: Logger) {
        self.sceneVM = sceneVM
        self.renderer = renderer
        self.logger = logger
    }

    func render() {
        logger.log("RenderViewModel: rendering video")
        Task {
            let url = await renderer.renderVideo(from: sceneVM.scenes)
            outputPath = url.path
            logger.log("RenderViewModel: video at \(url.path)")
        }
    }
}
