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
            Color.yellow.opacity(0.07)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Welcome Back")
                        .font(.custom("Futura", size: 34))
                        .bold()
                        .foregroundStyle(.orange)
                    
                    Text("Explore the patient dashboard")
                        .font(.custom("Futura", size: 18))
                        .foregroundStyle(.gray)
                }
                
                // MARK: - Vertical List Section
                VStack(alignment: .leading, spacing: 14) {
                    
                    Text("Patient List")
                        .font(.custom("Futura", size: 24))
                        .bold()
                        .foregroundStyle(.gray)
                    
                    List(MockData.patientNames, id: \.self) { patient in
                        
                        Text(patient)
                            .font(.custom("Futura", size: 18))
                            .foregroundStyle(.black)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .overlay {
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                            }
                            .cornerRadius(14)
                            .listRowInsets(EdgeInsets())
                            .padding(.vertical, 6)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .frame(height: 260)
                }
                .padding()
                .background(Color.white.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                // MARK: - Horizontal List Section
                VStack(alignment: .leading, spacing: 14) {
                    
                    Text("Quick Actions")
                        .font(.custom("Futura", size: 24))
                        .bold()
                        .foregroundStyle(.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 16) {
                            
                            ForEach(MockData.iconNames, id: \.self) { icon in
                                
                                VStack(spacing: 12) {
                                    
                                    Image(systemName: icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 28, height: 28)
                                        .foregroundStyle(.orange)
                                        .padding(24)
                                        .background(Color.orange.opacity(0.12))
                                        .clipShape(RoundedRectangle(cornerRadius: 18))
                                }
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeScreen()
}
