//
//  HomeScreen.swift
//  NewMacApp
//
//  Created by Mac on 09/04/26.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        ZStack{
            
            Color.mint.opacity(0.1)
            
            VStack(alignment: .leading){
                Text("Vertical List")
                    .foregroundStyle(.purple)
                    .font(.custom("verdana", size: 24))
                    .bold()
                
                
                List(MockData.patientNames, id: \.self) { patient in
                        Text("\(patient)")
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.indigo)
                            .bold()
                            .font(.custom("verdana", size: 20))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .cornerRadius(40)
                
                HStack{
                    VStack (alignment: .leading){
                        Text("Horizontal List")
                            .foregroundStyle(.purple)
                            .font(.custom("verdana", size: 24))
                            .bold()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(MockData.iconNames, id: \.self) { icon in
                                    Image(systemName: "\(icon)")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .foregroundStyle(.indigo)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 200)
                .cornerRadius(40)
            }
            .padding(.horizontal)
            .padding(.vertical, 80)
        }
        .ignoresSafeArea()
        
        
        
    }
}

#Preview {
    HomeScreen()
}
