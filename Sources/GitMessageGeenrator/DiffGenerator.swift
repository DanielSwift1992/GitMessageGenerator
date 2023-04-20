import Foundation

struct GitDiffGenerator {
    func generate(repoPath: String) -> String {
        
        let fileManager = FileManager.default
        
        guard fileManager.changeCurrentDirectoryPath(repoPath)
        else {
            print("Failed to change directory to repository path: \(repoPath)")
            return ""
        }
        
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["git", "diff", "--cached"]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        guard let output = String(data: data, encoding: .utf8)
        else {
            print("No output")
            return ""
        }
        
        return output
    }
}
