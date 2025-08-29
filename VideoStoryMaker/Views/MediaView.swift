import SwiftUI

struct MediaView: View {
    @EnvironmentObject var sceneVM: SceneViewModel
    @EnvironmentObject var mediaVM: MediaViewModel

    var body: some View {
        VStack {
            Button("Generate Voice") {
                mediaVM.synthesize(for: sceneVM.scenes)
            }
            if let url = mediaVM.audioURL {
                Text("Audio: \(url.lastPathComponent)")
                    .font(.caption)
            }
            List {
                ForEach($sceneVM.scenes) { $scene in
                    HStack {
                        TextField("Start", value: $scene.startTime, format: .number)
                        TextField("End", value: $scene.endTime, format: .number)
                        Text(scene.text)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MediaView()
        .environmentObject(SceneViewModel())
        .environmentObject(MediaViewModel())
}