import SwiftUI
import AppKit

struct ScenesView: View {
    @EnvironmentObject var storyVM: StoryViewModel
    @EnvironmentObject var sceneVM: SceneViewModel

    var body: some View {
        VStack {
            Button("Generate Images") {
                sceneVM.load(from: storyVM.scenes)
                sceneVM.generateImages()
            }
            List(sceneVM.scenes) { scene in
                HStack {
                    if let data = scene.imageData, let img = NSImage(data: data) {
                        Image(nsImage: img)
                            .resizable()
                            .frame(width: 100, height: 56)
                    } else {
                        Rectangle().fill(Color.gray).frame(width: 100, height: 56)
                    }
                    Text(scene.text)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ScenesView()
        .environmentObject(StoryViewModel())
        .environmentObject(SceneViewModel())
}