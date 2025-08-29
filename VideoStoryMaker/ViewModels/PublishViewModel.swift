import Foundation
import Combine

@MainActor
class PublishViewModel: ObservableObject {
    @Published var videoID: String = ""
    private let renderVM: RenderViewModel
    private let uploader: YouTubeUploader
    private let logger: Logger

    init(renderVM: RenderViewModel, uploader: YouTubeUploader, logger: Logger) {
        self.renderVM = renderVM
        self.uploader = uploader
        self.logger = logger
    }

    func upload() {
        logger.log("PublishViewModel: uploading video")
        Task {
            guard !renderVM.outputPath.isEmpty else {
                logger.log("PublishViewModel: no video to upload")
                return
            }
            let url = URL(fileURLWithPath: renderVM.outputPath)
            let id = await uploader.uploadVideo(at: url)
            videoID = id
            logger.log("PublishViewModel: uploaded with id \(id)")
        }
    }
}
