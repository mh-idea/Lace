//
// Created by mui-z on 2022/02/06.
//

import Foundation

public enum FileNameGenerator {}

extension FileNameGenerator {
    static func defaultFileName() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
        return "\(formatter.string(from: Date()))"
    }
}
