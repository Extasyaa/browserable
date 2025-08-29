import Foundation
import Combine

@MainActor
final class LogViewModel: ObservableObject {
    @Published var messages: [String] = []
    private var cancellable: AnyCancellable?

    init() {
        cancellable = Logger.shared.$messages
            .receive(on: RunLoop.main)
            .sink { [weak self] msgs in
                self?.messages = msgs
            }
    }
}