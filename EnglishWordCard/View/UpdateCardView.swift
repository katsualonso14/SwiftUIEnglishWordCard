
import SwiftUI
import SwiftData

    struct UpdateCardView: View {
        @Environment(\.dismiss) var dismiss
        @Environment(\.modelContext) var context
        @Bindable var item: CardItem
        
        var body: some View {
            List {
                TextField("Name", text: $item.title)
                TextField("Contents", text: $item.contents)
                Button("Update") {
                    try? context.save()
                    dismiss()
                    }
                    
                }
        }
    }

