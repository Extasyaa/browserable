import Foundation
import Combine

@MainActor
class LogViewModel: ObservableObject {
    @Published var messages: [String] = []
    private var cancellable: AnyCancellable?

    init() {
        cancellable = Logger.shared.$messages
            .receive(on: RunLoop.main)
            .assign(to: \.$messages, on: self)
    }
}
