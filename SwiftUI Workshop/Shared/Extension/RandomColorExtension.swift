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
            themeLightCyan, themeLightSlate,
            themeTeal, themeDarkSlate
        ]
    }
    
    static func random() -> Color {
        return allColors.randomElement() ?? themeTeal
    }
}
