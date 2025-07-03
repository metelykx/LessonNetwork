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
                    HStack {
                        ForEach(vm.topNews, id: \.url) { article in
                            TopArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                
                //MARK: - Bottom News
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.topNews, id: \.url) { article in
                            VStack {
                                if let url = article.urlToImage, let imageURL = URL(string: url) {
                                    AsyncImage(url: imageURL) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()  // Fixed typo here
                                                .frame(width:120,height: 120)
                                                .cornerRadius(10)
                                        } else {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 120, height: 120)
                                                    .foregroundStyle(.secondary)
                                                    .opacity(0.3)
                                                    .cornerRadius(10)
                                                
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .foregroundStyle(.secondary)
                                                    .scaledToFit()  // Fixed typo here
                                                    .frame(height: 50)
                                            }
                                        }
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(article.title)
                                        .titleFont()
                                    
                                    Spacer()
                                    
                                    Text(article.publishedAt.convertData())
                                        .descriptionFont()  // Added parentheses here
                                }
                                
                            }
                            .frame(width:120, height: 240)
                            .padding(10)
                            .background(.background)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(.secondary.opacity(0.2))
        }
    }
}

#Preview {
    ContentView()
}
