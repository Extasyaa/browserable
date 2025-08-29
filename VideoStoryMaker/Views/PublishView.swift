import SwiftUI

struct PublishView: View {
    @EnvironmentObject var publishVM: PublishViewModel

    var body: some View {
        VStack {
            Button("Upload to YouTube") {
                publishVM.upload()
            }
            Text(publishVM.videoID)
                .font(.caption)
        }
        .padding()
    }
}
