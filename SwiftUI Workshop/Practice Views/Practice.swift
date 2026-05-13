//
//  Practice.swift
//  SwiftUI Workshop
//
//  Created by Mac on 23/04/26.
//

import SwiftUI

class Practice {
    
    func loadJSON(){
        if let url = Bundle.main.url(forResource: "ProductJSON", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                print("Product JSON is : \(data)")
            }catch let error {
                print("Error while loading json : \(error.localizedDescription)")
            }
        }
    }
    
}

struct TestView: View {
    let practice = Practice()
    
    var body: some View {
        VStack{
            Text("Testing")
        }
        .onAppear {
            practice.loadJSON()
        }
    }
}


