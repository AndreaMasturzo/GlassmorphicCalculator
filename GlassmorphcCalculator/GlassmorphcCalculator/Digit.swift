//
//  Digit.swift
//  GlassmorphcCalculator
//
//  Created by Andrea Masturzo on 14/02/23.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
