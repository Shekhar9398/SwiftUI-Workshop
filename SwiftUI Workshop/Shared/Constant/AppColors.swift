//
//  AppColors.swift
//  SwiftUI Workshop
//
//  Created by Mac on 10/04/26.
//

import SwiftUI

struct AppColors {
    
    // MARK: - Theme Colors
    static let themeLightCyan = Color(hex: "#B8E3E9")
    static let themeLightSlate = Color(hex: "#93B1B5")
    static let themeTeal = Color(hex: "#4F7C82")
    static let themeDarkSlate = Color(hex: "#0B2E33")
    
    // MARK: - Theme
    struct Theme {
        static let background = Color(hex: "#F9FAFB") // general light bg
        static let backgroundTint = themeLightCyan
        static let surface = Color.white
        static let primary = themeTeal
        static let secondary = themeLightSlate
        static let textPrimary = themeDarkSlate
        static let textSecondary = themeTeal
    }
    
    // MARK: - Legacy Colors (Maintaining for compatibility before migration)
    static let softIndigo = Color(hex: "#6366F1")
    static let deepIndigo = Color(hex: "#4F46E5")
    static let softViolet = Color(hex: "#8B5CF6")
    static let deepViolet = Color(hex: "#7C3AED")
    static let softCyan = Color(hex: "#06B6D4")
    static let aquaBlue = Color(hex: "#22D3EE")
    
    // MARK: - Accent Colors
    static let neonBlue = Color(hex: "#3B82F6")
    static let electricPurple = Color(hex: "#A855F7")
    static let softPink = Color(hex: "#F472B6")
    static let coral = Color(hex: "#FB7185")
    
    // MARK: - Backgrounds
    static let pureWhite = Color(hex: "#FFFFFF")
    static let lightGray = Color(hex: "#F9FAFB")
    static let softGray = Color(hex: "#F3F4F6")
    static let mutedGray = Color(hex: "#E5E7EB")
    static let darkBackground = Color(hex: "#0F172A")
    static let elevatedSurface = Color(hex: "#FFFFFF")
    
    // MARK: - Card & Surface Variants
    static let cardLight = Color(hex: "#FFFFFF")
    static let cardSoft = Color(hex: "#F8FAFC")
    static let cardShadow = Color(hex: "#E2E8F0")
    
    // MARK: - Text Colors
    static let darkText = Color(hex: "#111827")
    static let primaryText = Color(hex: "#1F2933")
    static let mediumGray = Color(hex: "#6B7280")
    static let lightText = Color(hex: "#9CA3AF")
    static let disabledText = Color(hex: "#D1D5DB")
    static let inverseText = Color(hex: "#FFFFFF")
    
    // MARK: - Status Colors
    static let lightGreen = Color(hex: "#10B981")
    static let successGreen = Color(hex: "#22C55E")
    static let softAmber = Color(hex: "#F59E0B")
    static let warningYellow = Color(hex: "#FBBF24")
    static let softRed = Color(hex: "#EF4444")
    static let errorRed = Color(hex: "#DC2626")
    static let softBlue = Color(hex: "#3B82F6")
    static let infoBlue = Color(hex: "#2563EB")
    
    // MARK: - Borders & Dividers
    static let borderGray = Color(hex: "#E5E7EB")
    static let dividerGray = Color(hex: "#D1D5DB")
    static let subtleBorder = Color(hex: "#F1F5F9")
    
    // MARK: - Gradients
    static let gradientStart = Color(hex: "#6366F1")
    static let gradientMiddle = Color(hex: "#8B5CF6")
    static let gradientEnd = Color(hex: "#EC4899")
}
