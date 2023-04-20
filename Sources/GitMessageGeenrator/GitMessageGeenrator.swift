import Foundation

@main
public struct GitMessageGeenrator {
    
    private static let prompt = "create git commit message. It should consist only from the commit message itself. No quote marks, no other words should be present in the response. Here is the git diff: "
    
    public static func main() async throws {
        guard let parameters = GitDiffParameterExtractor().extract()
        else { return }
        
        let diffText = GitDiffGenerator().generate(repoPath: parameters.path)
        let gptService = GPTService(token: parameters.token)
        let text = try await gptService.getResponse(from: prompt + diffText)
        
        print(text)
    }
}


