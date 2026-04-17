//
//  ChatScreen.swift
//  SwiftUI Workshop
//
//  Created by Mac on 17/04/26.
//

import SwiftUI

struct YourScreen: View {
    @StateObject var speechService = SpeechToTextService()
    @State private var isSpeaking: Bool = false
    
    var body: some View{
        ZStack{
            Color.green.opacity(0.2)
            
            VStack{
                Text(speechService.audioTextString)
                    .frame(maxWidth: 300)
                    .padding()
                    .background(.white)
                    .padding()
                
                Spacer()
                
                ///MARK:- Mic
                Button {
                    isSpeaking.toggle()
                    handleSpeechToText()
                } label: {
                    Image(systemName: "mic.fill")
                        .resizable()
                        .frame(width: 25, height: 40)
                        .foregroundStyle(isSpeaking ? .red : .black)
                }
                
            }
            .padding(.vertical, 80)
        }
        .onAppear{
            speechService.requestSpeechPermissions()
        }
        
    }
    
    ///MARK: Actions
    private func handleSpeechToText(){
        if isSpeaking{
            speechService.start()
        }else{
            speechService.stop()
        }
    }
}

