//
// Created by mh-idea on 2022/02/06.
//

import Foundation

public func generateDefaultFileName() -> String {
    let formatter = DateFormatter()
    formatter.timeZone = .current
    formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
    return "\(formatter.string(from: Date()))"
}

