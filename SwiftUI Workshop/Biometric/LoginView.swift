//
//  BiometricAuthView.swift
//  SwiftUI Workshop
//
//  Created by Mac on 13/05/26.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var navigateToHomeScreen: Bool = false
    
    let usernameKey = "com.user.usernamekey"
    let passwordKey = "com.user.passwordKey"
    
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
                    }
                    
                    //login button
                    Button {
                        loginUser()
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
            .onAppear{
                checkSavedSession()
            }
            .navigationDestination(isPresented: $navigateToHomeScreen) {
                HomeScreen()
            }
            
        }
    }
    
}

extension LoginView {
    ///MARK:- Methods
    private func loginUser(){
        let creds = Credentials()
        
        if username == creds.username && password == creds.password {
            saveSession()
            navigateToHomeScreen = true
        }
    }
    
    private func saveSession(){
        UserDefaults.standard.set(username, forKey: usernameKey)
        UserDefaults.standard.set(password, forKey: passwordKey)
    }
    
    private func checkSavedSession(){
        let username = UserDefaults.standard.string(forKey: usernameKey)
        let password = UserDefaults.standard.string(forKey: passwordKey)
        
        if username != nil && password != nil {
            authenticateWithBiometrics()
        }
    }
    
    private func authenticateWithBiometrics(){
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            print("Cant evaluate policy")
            return
        }
        
        Task {
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Log In")
                
                if success {
                    navigateToHomeScreen = true
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}
