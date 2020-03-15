import Foundation
import Utility

extension String {
    var absolutePath: String {
        guard let url = URL(string: self, relativeTo: fileManager.currentDirectoryUrl) else {
            log.message("Could not convert path '\(self)' to type URL.", level: .error)
            log.exit(status: .failure)
            return "" // only reachable in unit tests
        }

        return url.absoluteString
    }

    var parentDirectoryPath: String {
        guard let url = URL(string: self) else {
            log.message("Could not convert path '\(self)' to type URL.", level: .error)
            log.exit(status: .failure)
            return "" // only reachable in unit tests
        }

        return url.deletingLastPathComponent().absoluteString
    }

    func appendingPathComponent(_ pathComponent: String) -> String {
        guard let pathUrl = URL(string: self) else {
            log.message("Could not convert path '\(self)' to type URL.", level: .error)
            log.exit(status: .failure)
            return "" // only reachable in unit tests
        }

        return pathUrl.appendingPathComponent(pathComponent).absoluteString
    }
}
