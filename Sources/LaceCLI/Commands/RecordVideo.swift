//
// Created by mui-z on 2022/02/06.
//

import Foundation
import SwiftCLI
import LaceKit

class RecordVideo: Command {
    let name: String = "rec"
    let shortDescription: String = "Record screen."

    @Param(completion: .filename)
    var outputFilePath: String?

    func execute() throws {
        let argFilePath = FilePathUtil.getFilePath(inputtedFilePath: outputFilePath, defaultType: "mov")
        let stderr = PipeStream()
        let task = Task.init(
                executable: "xcrun",
                arguments: ["simctl", "io", "booted", "recordVideo", "\(argFilePath)", "-f"],
                stderr: stderr
        )

        print("Start Recording...")
        print("If you press enter key, stop recording.")
        task.runAsync()

        if let _ = readLine() {
            task.interrupt()
            print("Output: \(argFilePath)")
        }
    }
}
