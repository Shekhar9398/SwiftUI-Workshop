//
//  HomeScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 09/04/26.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            AppColors.lightGray
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Vertical List Title
                Text("Vertical List")
                    .foregroundStyle(AppColors.softIndigo)
                    .font(.custom("verdana", size: 24))
                    .bold()
                
                // MARK: - Vertical List Card
                List(MockData.patientNames, id: \.self) { patient in
                    Text(patient)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(AppColors.primaryText)
                        .font(.custom("verdana", size: 18))
                        .background(AppColors.cardSoft)
                        .cornerRadius(12)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(AppColors.cardLight)
                .cornerRadius(20)
                
                // MARK: - Horizontal Section
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Horizontal List")
                        .foregroundStyle(AppColors.softViolet)
                        .font(.custom("verdana", size: 24))
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            
                            ForEach(Array(MockData.iconNames.enumerated()), id: \.element) { index, icon in
                                
                                let colors = AppColors.allColors
                                let color = colors[index % colors.count]
                                
                                VStack {
                                    Image(systemName: icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(20)
                                        .background(color.opacity(0.15))
                                        .foregroundStyle(color)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(AppColors.cardLight)
                .cornerRadius(20)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 80)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeScreen()
}
