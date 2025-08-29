#if canImport(SwiftUI)
import SwiftUI

struct RenderView: View {
    @EnvironmentObject var sceneVM: SceneViewModel
    @EnvironmentObject var mediaVM: MediaViewModel
    @EnvironmentObject var renderVM: RenderViewModel

    var body: some View {
        VStack {
            Button("Render Video") {
                renderVM.renderVideo(scenes: sceneVM.scenes, audioURL: mediaVM.audioURL)
            }
            if let url = renderVM.outputURL {
                Text("Video: \(url.lastPathComponent)")
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    RenderView()
        .environmentObject(SceneViewModel())
        .environmentObject(MediaViewModel())
        .environmentObject(RenderViewModel())
}
#endif
