import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Environment(\.modelContext) var context // コンテキスト
    
    @State private var showCreate = false
    @State private var cardItemEdit: CardItem?
    @Query private var items: [CardItem]
    
    init() {
        setNavigationBarColor()
    }
    
    
    var body: some View {
        NavigationStack {
            TabView{
                NewWordView()
                    .tabItem {
                        Label("NewWord", systemImage: "globe")
                    }
                TestView(number: 2)
                    .tabItem {
                        Label("Test2", systemImage: "star")
                    }
            }
            .navigationTitle("EnglishWordCard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            showCreate.toggle()
                        },
                        label:  {
                            Label("Add Item", systemImage: "plus")
                        })
                    .tint(.white)

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
    }
}

    
    
    
//     ナビゲーションバーのColor設定
private func setNavigationBarColor() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.systemRed  // BackGroud Calor
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]// textColor
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                      .font : UIFont.systemFont(ofSize: 20, weight: .bold)]
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}


#Preview {
    ContentView().modelContainer(for: CardItem.self)
}
