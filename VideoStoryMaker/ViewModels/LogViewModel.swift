import Foundation
import Combine

@MainActor
class LogViewModel: ObservableObject {
    @Published var logs: [String] = []
    private var cancellables = Set<AnyCancellable>()

    init(logger: Logger) {
        logger.$messages
            .sink { [weak self] in self?.logs = $0 }
            .store(in: &cancellables)
    }
}
