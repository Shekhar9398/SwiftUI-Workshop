//
//  GradientScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 13/04/26.
//

import SwiftUI

struct ClinicalQuestionScreen: View {
    
    @State private var selectedOption: String = "C"
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            LinearGradient(
                colors: [AppColors.Theme.backgroundTint, AppColors.Theme.surface,AppColors.Theme.backgroundTint ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                // MARK: - Top Bar
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3.bold())
                            .foregroundStyle(AppColors.Theme.primary)
                            .frame(width: 36, height: 36)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text("Question 1 of 15")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(AppColors.Theme.textPrimary.opacity(0.7))
                    
                    Spacer()
                    
                    // dummy for balance
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 36, height: 36)
                }
                
                // MARK: - Progress
                RectangularProgressBar(progress: 0.1)
                
                // MARK: - Category
                Text("GENERAL")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(AppColors.Theme.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(AppColors.Theme.primary.opacity(0.1))
                    .clipShape(Capsule())
                
                // MARK: - Question
                Text("How would you rate your overall health today?")
                    .font(.title2.bold())
                    .foregroundStyle(AppColors.Theme.textPrimary.opacity(0.85))
                    .multilineTextAlignment(.leading)
                
                // MARK: - Options
                VStack(spacing: 16) {
                    OptionCardView(
                        optionNumber: "A",
                        optionText: "Excellent",
                        isSelected: selectedOption == "A"
                    )
                    .onTapGesture { selectedOption = "A" }
                    
                    OptionCardView(
                        optionNumber: "B",
                        optionText: "Good",
                        isSelected: selectedOption == "B"
                    )
                    .onTapGesture { selectedOption = "B" }
                    
                    OptionCardView(
                        optionNumber: "C",
                        optionText: "Fair",
                        isSelected: selectedOption == "C"
                    )
                    .onTapGesture { selectedOption = "C" }
                    
                    OptionCardView(
                        optionNumber: "D",
                        optionText: "Poor",
                        isSelected: selectedOption == "D"
                    )
                    .onTapGesture { selectedOption = "D" }
                }
                
                Spacer()
                
                // MARK: - Bottom Buttons
                HStack(spacing: 16) {
                    
                    Button("Back") {
                        
                    }
                    .font(.headline)
                    .frame(width: 110, height: 50)
                    .foregroundStyle(AppColors.themeDarkSlate)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    Button("Next") {
                        
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(AppColors.Theme.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(20)
        }
    }
}


///MARK:- View Components
//RectangularProgressBar
private struct RectangularProgressBar: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(AppColors.Theme.primary)
                    .frame(width: geo.size.width * progress)
                    .animation(.easeInOut, value: progress)
            }
        }
        .frame(height: 8)
    }
}


//OptionCardView
private struct OptionCardView: View {
    let optionNumber: String
    let optionText: String
    var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            
            Text(optionNumber)
                .font(.headline)
                .frame(width: 36, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? AppColors.Theme.primary : AppColors.Theme.primary.opacity(0.15))
                )
                .foregroundStyle(isSelected ? .white : AppColors.Theme.primary)
            
            Text(optionText)
                .font(.body.weight(.medium))
                .foregroundStyle(AppColors.Theme.textPrimary.opacity(0.8))
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(isSelected ? AppColors.Theme.primary : Color.gray, lineWidth: 1.5)
                    .frame(width: 20, height: 20)
                
                if isSelected {
                    Circle()
                        .fill(AppColors.Theme.primary)
                        .frame(width: 10, height: 10)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? AppColors.Theme.primary.opacity(0.4) : Color.clear, lineWidth: 1)
        )
    }
}

#Preview {
    ClinicalQuestionScreen()
}
