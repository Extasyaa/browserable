import SwiftUI

struct PublishView: View {
    @EnvironmentObject var renderVM: RenderViewModel
    @EnvironmentObject var publishVM: PublishViewModel

    var body: some View {
        VStack {
            if let url = renderVM.outputURL {
                Button("Upload to YouTube") {
                    publishVM.upload(videoURL: url)
                }
            } else {
                Text("Render a video first.")
            }
            if let id = publishVM.videoID {
                Text("Video ID: \(id)")
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PublishView()
        .environmentObject(RenderViewModel())
        .environmentObject(PublishViewModel())
}