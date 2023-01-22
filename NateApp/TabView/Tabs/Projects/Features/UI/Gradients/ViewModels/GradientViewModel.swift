//
//  GradientViewModel.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

class GradientViewModel: ObservableObject {
    @Published var startColor = Color.white
    @Published var startPoint = UnitPointChoice(title: "Top", unitPoint: .top)
    
    @Published var endColor = Color.black
    @Published var endPoint = UnitPointChoice(title: "Bottom", unitPoint: .bottom)
    
    @Published var startPointsChoices = [UnitPointChoice(title: "Top", unitPoint: .top),
                                          UnitPointChoice(title: "Top Left", unitPoint: .topLeading),
                                          UnitPointChoice(title: "Top Right", unitPoint: .topTrailing)]
    
    @Published var endPointsChoices = [UnitPointChoice(title: "Bottom", unitPoint: .bottom),
                                       UnitPointChoice(title: "Bottom Left", unitPoint: .bottomLeading),
                                       UnitPointChoice(title: "Bottom Right", unitPoint: .bottomTrailing)]
}
