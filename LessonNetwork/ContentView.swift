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
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .frame(height: 150)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .frame(width: 260, height: 260)
                            .background(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .background(.secondary.opacity(0.2))
        }
        
        
    }
    
    //MARK: - Methods
   
}

#Preview {
    ContentView()
}
