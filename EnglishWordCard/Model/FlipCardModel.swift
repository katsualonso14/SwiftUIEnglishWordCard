import Foundation


class FlipCardModel: ObservableObject {
    @Published var isFlipped: Bool = false

    func flip() {
        isFlipped.toggle()
    }
}
