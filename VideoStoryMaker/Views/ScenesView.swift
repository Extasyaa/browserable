import SwiftUI

struct ScenesView: View {
    @EnvironmentObject var sceneVM: SceneViewModel

    var body: some View {
        List {
            ForEach(sceneVM.scenes) { scene in
                VStack(alignment: .leading) {
                    Text(scene.text)
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 150)
                }
                .padding(.vertical, 4)
            }
        }
    }
}
