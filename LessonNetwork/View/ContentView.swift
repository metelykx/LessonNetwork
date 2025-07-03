import SwiftUI
struct ContentView: View {
    
    //MARK: - Proporties
    @StateObject var vm = ViewModel()
    
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            //showIndicators - delete my favourite stick :)
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.topNews, id: \.url) { article in
                            
                            
                            NavigationLink(destination: EmptyView()) {
                                TopArticleView(article: article)
                            }.buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
                //MARK: - Bottom News
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.bottomnews, id: \.url) { article in
                            BottomArticleNewsView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }.shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                vm.fetchTopNews()
                vm.fetchBottomNews()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

