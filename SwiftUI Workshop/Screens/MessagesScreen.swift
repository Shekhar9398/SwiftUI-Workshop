//
//  MessageScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 09/04/26.
//

import SwiftUI

struct MessagesScreen: View {
    
    @State private var messages: [String] = MockData.messages
    
    var body: some View {
        
        ZStack {
            // MARK: - Background
            LinearGradient(
                colors: [AppColors.Theme.backgroundTint, AppColors.Theme.surface,AppColors.Theme.backgroundTint ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Messages")
                    .foregroundStyle(AppColors.Theme.textPrimary)
                    .font(.custom("verdana", size: 30))
                    .bold()
                
                List {
                    ForEach(Array(messages.enumerated()), id: \.offset) { index, message in
                        
                        HStack {
                            Text("\(messages[index].first ?? " ")")
                                .padding()
                                .background(AppColors.random().opacity(0.2))
                                .font(.custom("verdana", size: 20))
                                .bold()
                                .foregroundStyle(AppColors.Theme.textPrimary)
                                .clipShape(Circle())
                            
                            CardView(str: message)
                            
                            Button {
                                deleteMessage(at: index)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.red)
                                    .padding()
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .cornerRadius(20)
                .frame(maxWidth: .infinity)
                .scrollContentBackground(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
            .padding(.top, 80)
        }
    }
    
    // Correct delete logic (mutates @State)
    private func deleteMessage(at index: Int) {
        guard messages.indices.contains(index) else { return }
        messages.remove(at: index)
    }
}


private struct CardView: View {
    let str: String
    
    var body: some View {
        VStack {
            Text(str)
                .frame(maxWidth: .infinity)
                .foregroundStyle(AppColors.Theme.textPrimary)
                .font(.custom("verdana", size: 20))
                .bold()
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .background(AppColors.Theme.surface)
        .cornerRadius(16)
        .shadow(color: AppColors.Theme.secondary.opacity(0.5), radius: 6)
    }
}


#Preview {
    MessagesScreen()
}
