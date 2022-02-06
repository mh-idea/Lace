//
// Created by mh-idea on 2022/02/05.
//
import Foundation
import SwiftCLI
import PathKit
import LaceKit

class ScreenShot: Command {

    let name: String = "shot"
    let shortDescription: String = "Take Screen Shot."

    @Key("-p", "--path", description: "output file path. you can set directory and file name.")
    var inputtedFilePath: String?

    @Key("-t", "--type", description: "Can be \"png\", \"tiff\", \"bmp\", \"jpeg\". Default is png.\n")
    var inputtedFileType: String?

    func execute() throws {
        let filePath = getFilePath(inputtedFilePath: inputtedFilePath, defaultType: "png")
        var cmd = "xcrun simctl io booted screenshot \(filePath)"

        if let type = inputtedFileType {
            cmd += " --type=\(type)"
        }

        try Task.run(bash: cmd)
    }
}