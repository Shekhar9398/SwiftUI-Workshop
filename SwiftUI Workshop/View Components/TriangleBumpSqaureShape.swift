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
        
        let gapStartX = width / 2 - triangleWidth / 2
        let gapEndX = width / 2 + triangleWidth / 2
        
        // MARK: - Start Top Left
        
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        
        // TOP
        path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
        
        // TOP RIGHT CURVE
        path.addArc(
            center: CGPoint(
                x: width - cornerRadius,
                y: cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: false
        )
        
        // RIGHT
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))
        
        // BOTTOM RIGHT CURVE
        path.addArc(
            center: CGPoint(
                x: width - cornerRadius,
                y: height - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        // BOTTOM RIGHT LINE
        path.addLine(to: CGPoint(x: gapEndX, y: height))
        
        // RIGHT ANGLE SIDE
        path.addLine(to: CGPoint(x: width / 2, y: rect.height))
        
        // LEFT ANGLE SIDE
        path.addLine(to: CGPoint(x: gapStartX, y: height))
        
        // BOTTOM LEFT LINE
        path.addLine(to: CGPoint(x: cornerRadius, y: height))
        
        // BOTTOM LEFT CURVE
        path.addArc(
            center: CGPoint(
                x: cornerRadius,
                y: height - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        // LEFT
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        // TOP LEFT CURVE
        path.addArc(
            center: CGPoint(
                x: cornerRadius,
                y: cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        
        path.closeSubpath()
        
        return path
    }
}


struct AnyView: View {
    
    @State private var shouldShowMeasurementBubble: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.indigo.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                // MARK: - Fixed Button
                Button {
                    
                    withAnimation(.interactiveSpring) {
                        shouldShowMeasurementBubble.toggle()
                    }
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "heart.badge.bolt.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.pink)
                        
                        Text("My Measurements")
                            .font(.custom("Verdana", size: 18))
                            .foregroundStyle(.black)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                    }
                    .padding()
                    .background(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    .cornerRadius(15)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
                
            }
        }
        .overlay(alignment: .bottom) {
            
            if shouldShowMeasurementBubble {
                
                VStack(alignment: .center) {
                    
                    HStack {
                        
                        Image(systemName: "heart.badge.bolt.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.pink)
                        
                        Text("My Measurements")
                            .font(.custom("Verdana", size: 25))
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical)
                    
                    Text("Record your data to track your health trends over time")
                        .font(.custom("Verdana", size: 24))
                        .foregroundStyle(.gray)
                        .padding()
                    
                    Button {
                        
                    } label: {
                        
                        Text("Next")
                            .font(.custom("Verdana", size: 24))
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.mint)
                            .cornerRadius(15)
                            .padding()
                    }
                    .padding(.bottom)
                }
                .padding()
                .background(.white)
                .clipShape(
                    TriangleBumpSquareShape(
                        cornerRadius: 20,
                        triangleWidth: 30,
                        triangleHeight: 20
                    )
                )
                .overlay {
                    TriangleBumpSquareShape(
                        cornerRadius: 20,
                        triangleWidth: 30,
                        triangleHeight: 20
                    )
                    .stroke(Color.gray, lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.bottom, 120)
            }
        }
    }
}


#Preview {
    AnyView()
}
