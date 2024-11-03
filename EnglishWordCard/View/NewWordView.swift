import SwiftUI
import SwiftData

// Check New Word Page
struct NewWordView: View {
    @Environment(\.modelContext) var context
    
    @State private var showCreate = false
    @State private var cardItemEdit: CardItem?
    @Query private var items: [CardItem]
    
    
    var body: some View {
        
            List {
                // item contents in Stack
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            // Main Contens UI
                            
                            if(item.isDetail) {
                                Text(item.contents)
                                    .font(.subheadline)
                            } else {
                                Text(item.title)
                                    .font(.title)
                                    .bold()
                            }
                            
                        }
                        
                        Spacer()
                        Button {
                            withAnimation{
                                item.isCompleted.toggle()
                                try? context.save()
                                
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }.buttonStyle(.plain)
                    }
                    
                    .contentShape(Rectangle()) // outSide apply
                    .onTapGesture {
                        item.isDetail.toggle()
                    }
                    // Delete Action
                    .swipeActions{
                        Button(role: .destructive) {
                            // itemの削除
                            context.delete(item)
                            try? context.save() // 削除後にデータを保存
                        }
                        label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        }
                        Button {
                            // itemの更新
                            cardItemEdit = item
                            try? context.save() // 更新後にデータを保存
                        }
                        label: {
                            Label("Edit", systemImage: "pencil")
                        }.tint(.orange)
                        
                    }
                }
            }
        
    }
}
