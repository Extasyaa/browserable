#if canImport(SwiftUI)
import SwiftUI

struct LogsView: View {
    @EnvironmentObject var logVM: LogViewModel

    var body: some View {
        VStack {
            List(logVM.messages, id: \.self) { line in
                Text(line).font(.caption.monospaced())
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LogsView().environmentObject(LogViewModel())
}
#endif
