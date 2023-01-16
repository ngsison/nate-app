//
//  AnimationsView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/16/23.
//

import SwiftUI

struct AnimationsView: View {
    
    @State private var animating = false
    @State private var startDegreeAngle: Double = 0
    @State private var endDegreeAngle: Double = 0
    
    var body: some View {
        VStack(spacing: 100) {
            HeartView(size: 100, color: .pink)
                .rotationEffect(Angle(degrees: animating ? startDegreeAngle : endDegreeAngle))
            
            VStack {
                Button("Animate") {
                    withAnimation(.easeInOut) {
                        startDegreeAngle = -45
                        endDegreeAngle = 45
                    }
                    
                    withAnimation(.easeInOut.repeatForever()) {
                        animating.toggle()
                    }
                }
            }
        }
    }
}

struct AnimationsPreview: PreviewProvider {
    static var previews: AnimationsView {
        AnimationsView()
    }
}

fileprivate struct HeartView: View {
    var size: CGFloat
    var color: Color
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: size, height: size)
                .foregroundColor(color)
            
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(color)
                .padding(.top, -size)
            
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(color)
                .padding(.trailing, -size)
        }
        .rotationEffect(Angle(degrees: -45))
    }
}
