import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Environment(\.modelContext) var context // コンテキスト
    
    @State private var showCreate = false
    @State private var cardItemEdit: CardItem?
    @Query private var items: [CardItem]
    
//    init() {
//        setNavigationBarColor()
//    }

    var body: some View {
        NavigationStack {
            List {
                // itemの中身をStackにそれぞれ入れていく
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(item.contents)
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
                    
                    .contentShape(Rectangle()) // 外側に適用
                    .onTapGesture {
                        print("Tapped")
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
            .navigationTitle("WordCard")
                .toolbar {
                    ToolbarItem {
                        Button(
                            action: {
                                showCreate.toggle()
                            },
                            label:  {
                                Label("Add Item", systemImage: "plus")
                            })
                    }
                }
            // 下からのシート表示
                .sheet(isPresented: $showCreate,
                       content: {
                    NavigationStack {
                        CreateCardView()
                    }
                    .presentationDetents([.medium]) // 小さめで
                })
                .sheet(item: $cardItemEdit) {
                    cardItemEdit = nil
                } content: {
                    item in
                    UpdateCardView(item: item)
                }
            
        }
        
        
//        NavigationStack {
//            VStack {
//                Text("Hello!")
//            }
//            .navigationBarTitle("EnglishWordCard", displayMode: .inline)
//            .accessibilityAddTraits(.isHeader)
//    
//            
                    }
    }

    
    
    
    // ナビゲーションバーのColor設定
//    private func setNavigationBarColor() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor.systemRed  // BackGroud Calor
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]// textColor
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
//                                          .font : UIFont.systemFont(ofSize: 20, weight: .bold)]
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }


#Preview {
    ContentView().modelContainer(for: CardItem.self)
}
