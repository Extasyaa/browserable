import SwiftUI

struct StoryView: View {
    @EnvironmentObject var storyVM: StoryViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Tone", text: $storyVM.tone)
            TextField("Prompt", text: $storyVM.prompt, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
            Button("Generate Story") {
                storyVM.generateStory()
            }
            List(storyVM.scenes) { scene in
                Text(scene.text)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    StoryView().environmentObject(StoryViewModel())
}