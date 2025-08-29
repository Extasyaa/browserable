import SwiftUI

struct LogsView: View {
    @EnvironmentObject var logVM: LogViewModel

    var body: some View {
        ScrollView {
            Text(logVM.logs.joined(separator: "\n"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}
