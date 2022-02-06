//
// Created by osushi on 2022/02/06.
//

import Foundation

public extension String {
    func fileName() -> String {
        URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }

    func fileExtension() -> String {
        URL(fileURLWithPath: self).pathExtension
    }
}
