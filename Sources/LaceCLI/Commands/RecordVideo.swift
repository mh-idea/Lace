//
// Created by mh-idea on 2022/02/06.
//

import Foundation
import SwiftCLI
import LaceKit

class RecordVideo: Command {
    let name: String = "rec"
    let shortDescription: String = "Record screen."

    @Key("-p", "--path", description: "Output file path. You can set directory and file name.")
    var inputtedFilePath: String?

    func execute() throws {
        let filePath = getFilePath(inputtedFilePath: inputtedFilePath, defaultType: "mov")
        let stderr = PipeStream()
        let task = Task.init(
                executable: "xcrun",
                arguments: ["simctl", "io", "booted", "recordVideo", "\(filePath)", "-f"],
                stderr: stderr
        )

        print("Start Recording...")
        print("If you press enter key, stop recording.")
        task.runAsync()

        if let _ = readLine() {
            task.interrupt()
            print("Output: \(filePath)")
        }
    }
}
