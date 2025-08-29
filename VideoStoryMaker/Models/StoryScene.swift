import Foundation

/// Model representing a single scene of the story.
/// Renamed to avoid clashing with `SwiftUI.Scene`.
struct StoryScene: Identifiable, Codable {
    var id = UUID()
    var text: String
    var imageData: Data?
    var startTime: TimeInterval = 0
    var endTime: TimeInterval = 0
}
