//
//  BiometricAuthView.swift
//  SwiftUI Workshop
//
//  Created by Mac on 13/05/26.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var navigateToHomeScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                //background
                Color.yellow.opacity(0.07)
                
                VStack {
                    //lock icon
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 80, height: 110)
                        .foregroundStyle(.orange)
                    
                    //username
                    VStack(alignment: .leading){
                        Text("Username")
                            .bold()
                            .font(.custom("futura", size: 20))
                            .foregroundStyle(.gray)
                        
                        TextField("Enter Username", text: $username)
                            .padding(.horizontal, 16)
                            .frame(height: 60)
                            .background(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .cornerRadius(14)
                            .font(.custom("futura", size: 20))
                            .onSubmit {
                                saveToUserDefaults(text: username , keyString: "user.usernamekey")
                            }
                    }
                    .padding(.bottom)
                    
                    
                    //password
                    VStack(alignment: .leading){
                        Text("Password")
                            .bold()
                            .font(.custom("futura", size: 20))
                            .foregroundStyle(.gray)
                        
                        SecureField("Enter Password", text: $password)
                            .padding(.horizontal, 16)
                            .frame(height: 60)
                            .background(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .cornerRadius(14)
                            .font(.custom("futura", size: 20))
                            .onSubmit {
                                saveToUserDefaults(text: password, keyString: "user.passwordkey")
                            }
                    }
                    
                    //login button
                    Button {
                        navigateToHomeScreen = isCredsCorrect()
                    }label: {
                        Text("Login")
                            .frame(maxWidth: 200)
                            .foregroundStyle(.white)
                            .font(.custom("futura", size: 25))
                            .padding()
                            .background(Color.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToHomeScreen) {
                HomeScreen()
            }
        }
    }
    
    ///MARK:- Methods
    private func saveToUserDefaults(text: String, keyString: String){
        UserDefaults.standard.set(text, forKey: keyString)
    }
    
    private func isCredsCorrect() -> Bool {
        let creds = Credentials()
        
        if username == creds.username && password == creds.password {
            return true
        }
        
        return false
    }

}

#Preview {
    LoginView()
}
