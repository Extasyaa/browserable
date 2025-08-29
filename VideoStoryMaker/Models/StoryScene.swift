import Foundation

struct StoryScene: Identifiable {
    let id = UUID()
    var text: String
    var imageURL: URL?
    var startTime: Double?
    var endTime: Double?
}
