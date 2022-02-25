import SwiftUI

struct ContentView: View {
    
    @StateObject var shared = APIService.shared
    
    init() {
    }
    var body: some View {
        
        NavigationView {
            ZStack {
                List {
                    ForEach(shared.items.indices, id: \.self) { index in
                        
                        if index == 0 {
                            TopArticleView(article: self.shared.items[index])
                                .listRowInsets(EdgeInsets())
                        } else {
                            RegularArticleView(article: self.shared.items[index])
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("GeeksForGeeks")
                .onAppear {
                    shared.getArticles()
                    UITableView.appearance().backgroundColor = AppConstants.bgGrey
                    UITableView.appearance().separatorColor = .clear
                }
                .refreshable() {
                    print("Pulled to refresh")
                    shared.getArticles()
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
