//
//  CustomShapesView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/17/23.
//

import SwiftUI

struct CustomShapesView: View {
    var body: some View {
        Triangle()
            .frame(width: 100, height: 100)
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
