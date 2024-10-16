
import SwiftUI
import SwiftData

    struct UpdateCardView: View {
        @Environment(\.dismiss) var dismiss
        @Environment(\.modelContext) var context
        @Bindable var item: CardItem
        
        var body: some View {
            List {
                TextField("Name", text: $item.title)
                DatePicker("Chose a date",
                           selection: $item.timeStamp)
                Button("Update") {
                    try? context.save()
                    dismiss()
                    }
                    
                }
        }
    }

