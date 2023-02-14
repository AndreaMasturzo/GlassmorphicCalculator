//
//  Arithmetic.swift
//  GlassmorphcCalculator
//
//  Created by Andrea Masturzo on 14/02/23.
//

import Foundation

enum Operations: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
