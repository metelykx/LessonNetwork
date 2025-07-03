//
//  GradientAvatarView.swift
//  LessonNetwork
//
//  Created by Denis Ivaschenko on 03.07.2025.
//

import SwiftUI

struct GradientAvatarView: View {
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstant.avatarHeight / 4)
            .offset(y: -SizeConstant.avatarHeight / 4)
        }
    }
}
