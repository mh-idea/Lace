//
// Created by mh-idea on 2022/02/06.
//

import Foundation
import PathKit

public enum FilePathUtil {}

extension FilePathUtil {
    static public func getFilePath(inputtedFilePath: String?, defaultType: String) -> String {
        var fileNamePath: String = ""

        if inputtedFilePath == nil {
            fileNamePath = FileNameGenerator.defaultFileName() + "." + defaultType
        } else if Path(inputtedFilePath!).isDirectory {
            fileNamePath = inputtedFilePath!
            if inputtedFilePath!.last != "/" {
                fileNamePath += "/"
            }
            fileNamePath += FileNameGenerator.defaultFileName() + "." + defaultType
        } else {
            fileNamePath = inputtedFilePath!
        }

        return fileNamePath
    }
}
