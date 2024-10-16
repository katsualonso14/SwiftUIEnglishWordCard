

import SwiftUI
import SwiftData

@main
struct EnglishWordCardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: CardItem.self)
        }
    }
}
