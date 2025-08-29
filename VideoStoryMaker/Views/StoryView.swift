import SwiftUI

struct StoryView: View {
    @EnvironmentObject var viewModel: StoryViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Tone", text: $viewModel.tone)
            TextEditor(text: $viewModel.prompt)
                .frame(height: 150)
                .border(Color.gray)
            Button("Generate Story") {
                viewModel.generateStory()
            }
            .padding(.top)
        }
        .padding()
    }
}
