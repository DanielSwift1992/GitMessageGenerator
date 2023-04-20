import Foundation

struct GitDiffParameterExtractor {
    
    func extract() -> GitDiffParameters? {
        let parameters = CommandLine.arguments
        
        guard parameters.count == 3
        else {
            print("Failed to recieve path parameter: \(parameters)")
            return nil
        }
        
        return .init(path: parameters[1], token: parameters[2])
    }
}
