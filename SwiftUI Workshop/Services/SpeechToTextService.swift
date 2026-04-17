//
//  SpeechToText.swift
//  SwiftUI Workshop
//
//  Created by Mac on 17/04/26.
//

import Speech
import Combine
import AVFoundation

class SpeechToTextService: ObservableObject {
    
    @Published var audioTextString: String = ""
    
    private let recognizer = SFSpeechRecognizer()
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    func start() {
        guard let recognizer = recognizer, recognizer.isAvailable else { return }
        
        stop()
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { [weak self] buffer, _ in
            request.append(buffer)
        }
        
        audioEngine.prepare()
        try? audioEngine.start()
        
        recognitionTask = recognizer.recognitionTask(with: request) { [weak self] result, error in
            guard let self = self else { return }
            
            if let result = result {
                DispatchQueue.main.async {
                    self.audioTextString = result.bestTranscription.formattedString
                }
            }
            
            if error != nil {
                self.stop()
            }
        }
    }
    
    func stop() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        recognitionTask = nil
    }
    
    func requestSpeechPermissions(){
        
         AVAudioApplication.requestRecordPermission { granted in
             if granted {
                 print("Microphone permission is granted")
             }else{
                 print("Microphone permission denied")
             }
         }
         
         SFSpeechRecognizer.requestAuthorization { status in
             switch status {
             case .authorized:
                 print("Speech permission granted")
             case .restricted, .notDetermined, .denied :
                 print("Speech permission not granted")
             default:
                 print("No case available")
             }
         }
         
     }

}




