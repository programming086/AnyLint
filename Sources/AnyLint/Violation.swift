import Foundation
import Rainbow
import Utility

/// A violation found in a check.
public struct Violation {
    /// The info about the chack that caused this violation.
    public let checkInfo: CheckInfo

    /// The file path the violation is related to.
    public let filePath: String?

    /// The matched string that violates the check.
    public let matchedString: String?

    /// The info about the exact location of the violation within the file. Will be ignored if no `filePath` specified.
    public let locationInfo: String.LocationInfo?

    /// The autocorrection applied to fix this violation.
    public let appliedAutoCorrection: AutoCorrection?

    init(
        checkInfo: CheckInfo,
        filePath: String? = nil,
        matchedString: String? = nil,
        locationInfo: String.LocationInfo? = nil,
        appliedAutoCorrection: AutoCorrection? = nil
    ) {
        self.checkInfo = checkInfo
        self.filePath = filePath
        self.matchedString = matchedString
        self.locationInfo = locationInfo
        self.appliedAutoCorrection = appliedAutoCorrection
    }

    func locationMessage() -> String? {
        guard let filePath = filePath else { return nil }
        guard let locationInfo = locationInfo else { return filePath }
        return "\(filePath):\(locationInfo.line):\(locationInfo.charInLine)"
    }
}
