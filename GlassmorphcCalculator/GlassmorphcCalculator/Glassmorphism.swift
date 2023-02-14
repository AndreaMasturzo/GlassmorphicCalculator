//
//  Glassmorphism.swift
//  GlassmorphcCalculator
//
//  Created by Andrea Masturzo on 14/02/23.
//

import SwiftUI

struct ConcaveGlassView: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(width: width, height: height)
                .background(.ultraThinMaterial.opacity(0.3))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors:[.black,.white.opacity(0.75)], startPoint: .top, endPoint: .bottom), lineWidth: 2)
                        .blur(radius: 2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.radialGradient(Gradient(colors: [.clear,.black.opacity(0.07)]), center: .bottomLeading, startRadius: 200, endRadius: 0), lineWidth: 15)
                        .offset(x: 0.3, y: 1)
                )
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(width: width, height: height)
                .cornerRadius(14)
                .shadow(color: .white, radius: 3, x: -3, y: -3)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
        }
    }
}
