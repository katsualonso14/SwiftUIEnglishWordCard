import SwiftUI

struct CreateCardView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = CardItem()
    var body: some View {
        List {
            TextField("Name", text: $item.title)
            DatePicker("Chose a date",
                       selection: $item.timeStamp)
            Button("Create") {
                withAnimation {
                    context.insert(item)
                    try? context.save() // データを保存
                }
                dismiss()
            }
        }.navigationTitle("Create Card")
    }
}

#Preview {
    CreateCardView()
}
