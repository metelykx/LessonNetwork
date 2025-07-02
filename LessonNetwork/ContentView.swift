//
//  ContentView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 02.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Proporties
    @StateObject var vm = ViewModel()
    
    
    //MARK: - Body
    var body: some View {
        VStack {
           
            ForEach(vm.topNews, id: \.url) { article in
                Text(article.title)
            }
        }
        
    }
    
    //MARK: - Methods
   
}

#Preview {
    ContentView()
}
