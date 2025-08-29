import Foundation

struct ChatGPTService {
    static let shared = ChatGPTService()
    private let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]

    func generateStory(tone: String, prompt: String) async throws -> [Scene] {
        if apiKey == nil {
            Logger.shared.log("OPENAI_API_KEY missing, using offline placeholder story")
            return [Scene(text: "Offline placeholder scene", imageData: nil)]
        }

        var request = URLRequest(url: URL(string: "https://api.openai.com/v1/chat/completions")!)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "system", "content": "You are a story generator returning JSON scenes"],
                ["role": "user", "content": "tone: \(tone) prompt: \(prompt)"]
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, _) = try await URLSession.shared.data(for: request)
        Logger.shared.log("ChatGPT response received")

        // Parse response for scenes; simplified placeholder
        let text = String(data: data, encoding: .utf8) ?? "No response"
        return [Scene(text: text, imageData: nil)]
    }
}
