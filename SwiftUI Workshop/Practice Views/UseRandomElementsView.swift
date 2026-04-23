//
//  CarouselView.swift
//  SwiftUI Workshop
//

import SwiftUI

struct UseRandomElementsView: View {
    
    let items: [String] = [
        "Prduct", "Value","Profit", "Discounts", "Margin",
        "Loss", "Prduct", "Value","Profit", "Discounts",
        "Margin", "Loss", "Prduct", "Value","Profit", "Discounts"
    ]
    
    var body: some View{
        List(Array(items.enumerated()), id: \.offset){ index, item in
            VStack {
                Image(systemName: randomSystemImage(index: index))
                    .resizable()
                    .frame(width: 50, height: 60)
                    .foregroundStyle(.white)
                    .padding()
                
                Text(item)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
            }
            .frame(height: 220)
            .background(randomGradients(index: index))
            .clipShape(LeafShape)

        }
        .listStyle(.plain)
    }
    
    //View Components
    private var LeafShape: some Shape {
        UnevenRoundedRectangle(topLeadingRadius: 25, bottomLeadingRadius: 1, bottomTrailingRadius: 25, topTrailingRadius: 1)
    }
    
    //Return a single gradient but random
    private func randomGradients(index: Int) -> LinearGradient{
        let gradients = [
            LinearGradient(colors: [AppColors.deepIndigo, AppColors.royalPurple], startPoint: .top, endPoint: .bottom),
            LinearGradient(colors: [AppColors.coralRed, AppColors.softRed], startPoint: .top, endPoint: .bottom),
            LinearGradient(colors: [AppColors.mintGreen, AppColors.lightGreen], startPoint: .top, endPoint: .bottom),
            LinearGradient(colors: [AppColors.softIndigo, AppColors.aquaBlue], startPoint: .top, endPoint: .bottom),
            LinearGradient(colors: [AppColors.warningYellow, AppColors.burntOrange], startPoint: .top, endPoint: .bottom),
            LinearGradient(colors: [AppColors.skyBlue, AppColors.neonBlue], startPoint: .top, endPoint: .bottom)
        ]
        
        let safeIndex = (index % gradients.count)
        return gradients[safeIndex]
    }
    
    //return one sf symbol name but random
    private func randomSystemImage(index: Int) -> String {
        let symbols = [
            "flame", "crown", "star", "atom",
            "bolt", "sparkles", "shield", "diamond"
        ]
        
        let safeIndex = (index % symbols.count)
        return symbols[safeIndex]
    }
}


#Preview {
    UseRandomElementsView()
}
