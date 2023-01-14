//
//  GradientView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

struct UnitPointChoice: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var unitPoint: UnitPoint
}

struct GradientView: View {
    @State private var startColor = Color.white
    @State private var startPoint = UnitPointChoice(title: "Top", unitPoint: .top)
    
    @State private var endColor = Color.black
    @State private var endPoint = UnitPointChoice(title: "Bottom", unitPoint: .bottom)
    
    private var startPointsChoices = [UnitPointChoice(title: "Top", unitPoint: .top),
                                      UnitPointChoice(title: "Top Left", unitPoint: .topLeading),
                                      UnitPointChoice(title: "Top Right", unitPoint: .topTrailing)]
    
    private var endPointsChoices = [UnitPointChoice(title: "Bottom", unitPoint: .bottom),
                                    UnitPointChoice(title: "Bottom Left", unitPoint: .bottomLeading),
                                    UnitPointChoice(title: "Bottom Right", unitPoint: .bottomTrailing)]
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [startColor, endColor],
                           startPoint: startPoint.unitPoint,
                           endPoint: endPoint.unitPoint)
            .ignoresSafeArea(.all)
            
            Form {
                ColorPicker("Select Start Color", selection: $startColor)
                ColorPicker("Select End Color", selection: $endColor)
                
                Picker("Start Point", selection: $startPoint) {
                    ForEach(startPointsChoices) { choice in
                        Text(choice.title).tag(choice)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("End Point", selection: $endPoint) {
                    ForEach(endPointsChoices) { choice in
                        Text(choice.title).tag(choice)
                    }
                }
                .pickerStyle(.menu)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
