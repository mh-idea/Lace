//
// Created by osushi on 2022/02/06.
//

import Foundation
import PathKit

public func getFilePath(inputtedFilePath: String?, defaultType: String) -> String {
    var fileNamePath: String = ""

    if inputtedFilePath == nil {
        fileNamePath = generateDefaultFileName() + "." + defaultType
    } else if Path(inputtedFilePath!).isDirectory {
        fileNamePath = inputtedFilePath!
        if inputtedFilePath!.last != "/" {
            fileNamePath += "/"
        }
        fileNamePath += generateDefaultFileName() + "." + defaultType
    } else {
        fileNamePath = inputtedFilePath!
    }

    return fileNamePath
}
