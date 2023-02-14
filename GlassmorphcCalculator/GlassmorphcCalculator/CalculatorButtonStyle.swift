//
//  CalculatorButtonStyle.swift
//  GlassmorphcCalculator
//
//  Created by Andrea Masturzo on 14/02/23.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .medium))
                .frame(width: size, height: size)
                .frame(maxWidth: isWide ? .infinity : size, alignment: .leading)
//                .background(.clear)
                .foregroundColor(.black.opacity(0.5))
                .cornerRadius(20)
                .modifier(ConcaveGlassView(width: size, height: size))
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.2)
                            .cornerRadius(20)
                    }
                }
//                .clipShape(Capsule())
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.zero)
    
    static var previews: some View {
        Button(buttonType.description) { }
            .buttonStyle(CalculatorButtonStyle(
                size: 80,
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroundColor,
                isWide: buttonType == .digit(.zero))
            )
            .padding()
    }
}
