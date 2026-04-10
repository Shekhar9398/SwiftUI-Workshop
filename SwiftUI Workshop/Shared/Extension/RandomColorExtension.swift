//
//  RandomColorExtension.swift
//  SwiftUI Workshop
//
//  Created by Mac on 10/04/26.
//
import SwiftUI

extension AppColors {
    
    static var allColors: [Color] {
        return [
            softIndigo, deepIndigo,
            softViolet, deepViolet,
            softCyan, aquaBlue,
            neonBlue, electricPurple,
            softPink, coral,
            lightGreen, successGreen,
            softAmber, warningYellow,
            softRed, errorRed,
            softBlue, infoBlue
        ]
    }
    
    static func random() -> Color {
        return allColors.randomElement() ?? .blue
    }
}
