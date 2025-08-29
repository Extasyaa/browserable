import Foundation
import Combine

final class Logger: ObservableObject {
    static let shared = Logger()
    @Published private(set) var messages: [String] = []
    private let logURL: URL

    private init() {
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent("VideoStoryMakerLogs", isDirectory: true)
        try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        logURL = folder.appendingPathComponent("app.log")
    }

    func log(_ message: String) {
        let line = "\(ISO8601DateFormatter().string(from: Date())) - \(message)"
        DispatchQueue.main.async {
            self.messages.append(line)
        }
        let data = (line + "\n").data(using: .utf8)!
        if FileManager.default.fileExists(atPath: logURL.path) {
            if let handle = try? FileHandle(forWritingTo: logURL) {
                handle.seekToEndOfFile()
                handle.write(data)
                try? handle.close()
            }
        } else {
            try? data.write(to: logURL)
        }
    }
}
