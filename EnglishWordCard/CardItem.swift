// モデル
import Foundation
import SwiftData

@Model
final class CardItem {
    var title: String
    var timeStamp: Date
    var isCompleted: Bool
    
    init(
        title: String = "",
        timeStamp: Date = .now,
        isCretical: Bool = false,
        isCompleted: Bool = false) {
        self.title = title
        self.timeStamp = timeStamp
        self.isCompleted = isCompleted
    }
}
