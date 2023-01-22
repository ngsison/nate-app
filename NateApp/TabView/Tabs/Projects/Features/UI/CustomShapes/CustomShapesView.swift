//
//  CustomShapesView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/17/23.
//

import SwiftUI

struct CustomShapesView: View {
    var body: some View {
        HStack {
            Heart()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Triangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            MapBalloon()
                .frame(width: 100, height: 100)
                .foregroundColor(.mint)
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}

struct CustomShapesPreview: PreviewProvider {
    static var previews: some View {
        CustomShapesView()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let topCenter = CGPoint(x: rect.midX, y: rect.minY)
        
        var path = Path()
        path.move(to: bottomLeft)
        path.addLine(to: bottomRight)
        path.addLine(to: topCenter)
        return path
    }
}

struct MapBalloon: Shape {
    func path(in rect: CGRect) -> Path {
        let topCenter = CGPoint(x: rect.midX, y: rect.minY)
        let bottomCenter = CGPoint(x: rect.midX, y: rect.maxY)
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let midLeft = CGPoint(x: rect.minX, y: rect.midY)
        let midRight = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        path.move(to: bottomCenter)
        path.addCurve(to: topCenter, control1: midLeft, control2: topLeft)
        path.addCurve(to: bottomCenter, control1: topRight, control2: midRight)
        return path
    }
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        let topCenter = CGPoint(x: rect.midX, y: rect.height * 0.4)
        let bottomCenter = CGPoint(x: rect.midX, y: rect.height * 0.8)
        let topLeft = CGPoint(x: rect.width * 0.3, y: rect.minY)
        let topRight = CGPoint(x: rect.width * 0.7, y: rect.minY)
        let midLeft = CGPoint(x: rect.minX, y: rect.midY)
        let midRight = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        path.move(to: bottomCenter)
        path.addCurve(to: topCenter, control1: midLeft, control2: topLeft)
        path.addCurve(to: bottomCenter, control1: topRight, control2: midRight)
        return path
    }
}
