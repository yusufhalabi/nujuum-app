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
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color("NujuumGold").opacity(0.10))
                        .frame(width: 260, height: 260)
                        .blur(radius: 60)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                        .animation(.easeOut(duration: 1.0), value: logoOpacity)
                        .animation(.easeOut(duration: 1.0), value: logoScale)
                    
                    Image("NujuumFullLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .opacity(logoOpacity)
                        .scaleEffect(logoScale)
                        .shadow(color: Color.black.opacity(0.25), radius: 18, x: 0, y: 10)
                        .shadow(color: Color("NujuumGold").opacity(0.18), radius: 24, x: 0, y: 0)
                        .animation(.easeOut(duration: 1.0), value: logoOpacity)
                        .animation(.spring(response: 0.8, dampingFraction: 0.9, blendDuration: 0.2), value: logoScale)
                }
                
                Spacer()
            }
        }
        .onAppear {
            logoOpacity = 1.0
            logoScale = 1.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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