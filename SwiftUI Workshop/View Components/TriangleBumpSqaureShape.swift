//
//  BubbleShape.swift
//  SwiftUI Workshop
//
//  Created by Mac on 14/05/26.
//

import SwiftUI

struct TriangleBumpSquareShape: Shape {

    let cornerRadius: CGFloat
    let triangleWidth: CGFloat
    let triangleHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let width = rect.width
        let height = rect.height - triangleHeight
        
        // MARK: - Rounded Rectangle
        
        path.addRoundedRect(
            in: CGRect(
                x: 0,
                y: 0,
                width: width,
                height: height
            ),
            cornerSize: CGSize(
                width: cornerRadius,
                height: cornerRadius
            )
        )
        
        // MARK: - Triangle Bump
        
        let triangleRight = CGPoint(
            x: width / 2 + triangleWidth / 2,
            y: height
        )
        
        let triangleBottom = CGPoint(
            x: width / 2,
            y: rect.height
        )
        
        let triangleLeft = CGPoint(
            x: width / 2 - triangleWidth / 2,
            y: height
        )
        
        path.move(to: triangleRight)
        path.addLine(to: triangleBottom)
        path.addLine(to: triangleLeft)
        path.closeSubpath()
        
        return path
    }
}


struct AnyView: View {
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image(systemName: "crown.fill")
                .imageScale(.large)
                .padding()
            
            Text("Add your text message here")
                .font(.custom("futura", size: 25))
                .padding()
            
            Spacer()
        }
        .frame(width: 300, height: 250)
        .background(.mint)
        .clipShape(
            TriangleBumpSquareShape(
                cornerRadius: 20,
                triangleWidth: 30,
                triangleHeight: 20
            )
        )
        .cornerRadius(12)
        
    }
    
}

#Preview {
    AnyView()
}
