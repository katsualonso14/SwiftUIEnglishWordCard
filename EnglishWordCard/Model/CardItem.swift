// モデル
import Foundation
import SwiftData

@Model
final class CardItem {
    var title: String
    var contents: String
    var isDetail: Bool = false
    var isCompleted: Bool
    
    init(
        title: String = "",
        contents: String = "",
        isDetail: Bool = false,
        isCompleted: Bool = false) {
        self.title = title
        self.contents = contents
        self.isDetail = isDetail
        self.isCompleted = isCompleted
    }
}
