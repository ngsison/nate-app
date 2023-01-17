//
//  CustomShapesView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/17/23.
//

import SwiftUI

struct CustomShapesView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Triangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)
                
                MapBalloon()
                    .frame(width: 150, height: 100)
                    .foregroundColor(.mint)
            }
            .frame(height: 200)
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}

struct CustomShapesPreview: PreviewProvider {
    static var previews: some View {
        CustomShapesView()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct MapBalloon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}
