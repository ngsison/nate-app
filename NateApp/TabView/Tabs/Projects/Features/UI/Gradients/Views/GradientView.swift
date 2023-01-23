//
//  GradientView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

struct GradientView: View {
    @ObservedObject private var viewModel = GradientViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [viewModel.startColor, viewModel.endColor],
                           startPoint: viewModel.startPoint.unitPoint,
                           endPoint: viewModel.endPoint.unitPoint)
            .ignoresSafeArea(.all)
            
            Form {
                ColorPicker("Select Start Color", selection: $viewModel.startColor)
                ColorPicker("Select End Color", selection: $viewModel.endColor)
                UnitPointPicker(title: "Select Start Point", choices: $viewModel.startPointsChoices, selection: $viewModel.startPoint)
                UnitPointPicker(title: "Select End Point", choices: $viewModel.endPointsChoices, selection: $viewModel.endPoint)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct GradientPreview: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}

fileprivate struct UnitPointPicker: View {
    var title: String
    @Binding var choices: [UnitPointChoice]
    @Binding var selection: UnitPointChoice
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(choices, id: \.self) { choice in
                Text(choice.title).tag(choice)
            }
        }
        .pickerStyle(.menu)
    }
}
