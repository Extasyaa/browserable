import Foundation
import AVFoundation

struct TTSService {
    static let shared = TTSService()
    private let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]

    func synthesize(_ text: String, to url: URL) async throws {
        if apiKey == nil {
            Logger.shared.log("Using system TTS fallback")
            try await synthesizeOffline(text)
            return
        }
        // Implement ChatGPT TTS request here
        Logger.shared.log("ChatGPT TTS not implemented, using offline fallback")
        try await synthesizeOffline(text)
    }

    private func synthesizeOffline(_ text: String) async throws {
        let utterance = AVSpeechUtterance(string: text)
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        Logger.shared.log("System TTS playback completed")
    }
}