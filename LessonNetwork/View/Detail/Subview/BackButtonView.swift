//
//  BackButtonView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 03.07.2025.
//

import SwiftUI

struct BackButtonView: View {
    //MARK: - Proporties
    @Environment(\.dismiss) var dismiss
    
    
    //MARK: - View
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(.black)
                    .opacity(0.3)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
        }

    }
}
