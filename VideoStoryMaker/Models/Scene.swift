import Foundation

struct Scene: Identifiable, Codable {
    var id = UUID()
    var text: String
    var imageData: Data?
    var startTime: TimeInterval = 0
    var endTime: TimeInterval = 0
}
