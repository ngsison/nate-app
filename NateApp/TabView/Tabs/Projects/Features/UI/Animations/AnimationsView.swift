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
    
    private var itemSize: Double = 80
    
    var body: some View {
        VStack(spacing: 40) {
            ScrollView(.horizontal) {
                HStack(spacing: itemSize) {
                    HeartView(size: itemSize, color: .pink)
                        .rotationEffect(Angle(degrees: animating ? startDegreeAngle : endDegreeAngle))
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.mint)
                            .frame(width: animating ? itemSize * 2 : itemSize,
                                   height: animating ? itemSize * 2 : itemSize)
                    }
                    .frame(width: itemSize * 2, height: itemSize * 2)
                    
                    Circle()
                        .foregroundColor(.orange)
                        .frame(width: itemSize, height: itemSize)
                        .offset(x: 0,
                                y: animating ? -60 : 60)
                }
                .frame(height: 200)
                .padding(.horizontal, itemSize)
            }
            .scrollIndicators(.hidden)
            .background(.black.opacity(0.1))
            
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
