import SwiftUI

struct RenderView: View {
    @EnvironmentObject var renderVM: RenderViewModel

    var body: some View {
        VStack {
            Button("Render Video") {
                renderVM.render()
            }
            Text(renderVM.outputPath)
                .font(.caption)
        }
        .padding()
    }
}
