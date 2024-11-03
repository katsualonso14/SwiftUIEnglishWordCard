
import Foundation
import SwiftUI

struct TestView: View {
    let number: Int
    var body: some View {
        VStack {
            Image(systemName: number == 1 ? "globe" : "star")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("TestView \(number)")
                .font(.title)
        }
        .padding()
    }
}
