import Foundation
import OpenAISwift

struct GPTService {
    
    private let openAIService: OpenAISwift
    
    init(token: String) {
        openAIService = OpenAISwift(authToken: token)
    }
    
    func getResponse(from text: String) async throws -> String {
        let messages = try await openAIService.sendChat(
            with: [.init(role: .user, content: text)]
        )
        
        guard let response = messages.data ?? messages.choices
        else { return "" }
        
        return response
            .map { $0.message.content }
            .joined()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
