//
// Created by mui-z on 2022/02/05.
//
import Foundation
import SwiftCLI
import PathKit
import LaceKit

class ScreenShot: Command {

    let name: String = "shot"
    let shortDescription: String = "Take Screen Shot."

    @Param(completion: .filename)
    var outputFilePath: String?

    @Key("-t", "--type", description: "Can be \"png\", \"tiff\", \"bmp\", \"jpeg\". Default is png.\n")
    var inputtedFileType: String?

    func execute() throws {
        let argFilePath = FilePathUtil.getFilePath(inputtedFilePath: outputFilePath, defaultType: "png")
        var cmd = "xcrun simctl io booted screenshot \(argFilePath)"

        if let type = inputtedFileType {
            cmd += " --type=\(type)"
        }

        try Task.run(bash: cmd)
    }
}