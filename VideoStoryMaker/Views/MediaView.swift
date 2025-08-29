import SwiftUI

struct MediaView: View {
    @EnvironmentObject var mediaVM: MediaViewModel

    var body: some View {
        VStack {
            List {
                ForEach($mediaVM.scenes) { $scene in
                    VStack(alignment: .leading) {
                        Text(scene.text)
                        HStack {
                            TextField("Start", value: $scene.startTime, format: .number)
                            TextField("End", value: $scene.endTime, format: .number)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            Button("Generate Voice") {
                mediaVM.generateVoice()
            }
        }
        .padding()
    }
}
