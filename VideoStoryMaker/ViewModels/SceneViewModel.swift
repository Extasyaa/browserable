import Foundation
import Combine

@MainActor
class SceneViewModel: ObservableObject {
    @Published var scenes: [StoryScene] = []
}
