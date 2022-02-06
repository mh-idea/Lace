import SwiftCLI
import LaceKit
import Rainbow
import Foundation

public class LaceCLI {
    public init() {}
    public func run() -> Never {
        Rainbow.enabled = Term.isTTY

        guard checkXcrunExists() else {
            print("ERROR: ".red + "xcrun does not exists.")
            exit(EXIT_FAILURE)
        }

        let cli = CLI(name: "lace", version: "0.1.0", description: "ios simulator screenshot and record automation.")

        cli.commands = [
            ScreenShot(),
            RecordVideo()
        ]

        cli.goAndExit()
    }
}