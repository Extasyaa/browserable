import Foundation

struct Story: Identifiable, Codable {
    var id = UUID()
    var tone: String
    var prompt: String
    var scenes: [StoryScene]
}
