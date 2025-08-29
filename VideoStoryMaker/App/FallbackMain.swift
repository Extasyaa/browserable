#if !canImport(SwiftUI)
import Foundation

@main
struct FallbackMain {
    static func main() {
        print("VideoStoryMaker requires macOS and SwiftUI")
    }
}
#endif
