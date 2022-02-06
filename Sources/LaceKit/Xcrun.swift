import SwiftCLI

public func checkXcrunExists() -> Bool {
    do {
        _ = try Task.capture(bash: "command -v xcrun").stdout
        return true
    }
    catch {
        return false
    }
}