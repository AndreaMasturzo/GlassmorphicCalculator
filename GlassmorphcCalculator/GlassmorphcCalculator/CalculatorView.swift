//
//  CalculatorView.swift
//  GlassmorphcCalculator
//
//  Created by Andrea Masturzo on 14/02/23.
//

import SwiftUI

// MARK: - BODY
struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.purple, .yellow])
    let gradient2 = Gradient(colors: [.blue, .purple])
    
    var body: some View {
        ZStack {
            Rectangle()
                .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                        self.progress = 1.0
                    }
                    
                }
            VStack {
                Spacer()
                displayText
                buttonPad
            }
            .padding(Constants.padding)
            //        .background(Color.black)
        }
    }
}

// MARK: - PREVIEWS
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
    }
}

// MARK: - COMPONENTS
extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
        //            .padding()
            .foregroundColor(.black.opacity(0.5))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
            .modifier(ConcaveGlassView(width: UIScreen.main.bounds.width - 22, height: 80))
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
