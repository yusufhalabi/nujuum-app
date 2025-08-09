//
//  SplashScreenView.swift
//  Nujuum
//
//  Created by Yusuf Halabi on 8/8/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var logoOpacity: Double = 0
    @State private var logoScale: Double = 0.8
    @State private var starOpacity: Double = 0
    @State private var starGlow: Double = 0
    @State private var shimmerOffset: CGFloat = -50
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            // Beautiful purple gradient background matching reference
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color("NujuumPurple").opacity(0.9), location: 0.0),
                    .init(color: Color("NujuumPurple"), location: 0.4),
                    .init(color: Color("NujuumPurple"), location: 0.6),
                    .init(color: Color("NujuumPurple").opacity(0.8), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Logo and star positioned exactly as in reference
                ZStack(alignment: .center) {
                    // Main logo text
                    Image("NujuumLogoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                        .opacity(logoOpacity)
                        .scaleEffect(logoScale)
                        .animation(.easeOut(duration: 1.2), value: logoOpacity)
                        .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.2), value: logoScale)
                    
                    // Gold star positioned on the J
                    Image("NujuumStar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .offset(x: 18, y: -8)
                        .opacity(starOpacity)
                        .scaleEffect(logoScale)
                        .shadow(color: Color("NujuumGold").opacity(starGlow * 0.8), radius: 6, x: 0, y: 0)
                        .shadow(color: Color("NujuumGold").opacity(starGlow * 0.4), radius: 12, x: 0, y: 0)
                        .overlay(
                            // Subtle shimmer effect
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.clear,
                                            Color.white.opacity(0.6),
                                            Color.clear
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(15))
                                .offset(x: shimmerOffset)
                                .mask(
                                    Image("NujuumStar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16, height: 16)
                                )
                        )
                        .animation(.easeOut(duration: 1.0).delay(0.4), value: starOpacity)
                        .animation(.easeOut(duration: 1.0).delay(0.4), value: starGlow)
                        .animation(.easeInOut(duration: 0.8).delay(1.2), value: shimmerOffset)
                }
                
                Spacer()
            }
        }
        .onAppear {
            withAnimation {
                logoOpacity = 1.0
                logoScale = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation {
                    starOpacity = 1.0
                    starGlow = 0.8
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation {
                    shimmerOffset = 50
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isActive = true
            }
        }
        .statusBar(hidden: true)
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
    }
}

#Preview {
    SplashScreenView()
}