//
//  GradientBackground.swift
//  Nujuum
//
//  Created by Yusuf Halabi on 8/8/25.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color("NujuumPurple").opacity(1.0),
                    Color("NujuumPurple").opacity(0.9),
                    Color("NujuumPurple").opacity(0.75)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.12),
                    Color.clear
                ]),
                center: .center,
                startRadius: 20,
                endRadius: 350
            )
            .blendMode(.screen)
            .opacity(0.6)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackground()
}