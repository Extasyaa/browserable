import Foundation
import Combine

class Logger: ObservableObject {
    @Published var messages: [String] = []
    func log(_ message: String) {
        DispatchQueue.main.async {
            self.messages.append(message)
        }
    }
}
