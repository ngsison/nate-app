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
    @StateObject private var viewModel = GradientViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [viewModel.startColor, viewModel.endColor],
                           startPoint: viewModel.startPoint.unitPoint,
                           endPoint: viewModel.endPoint.unitPoint)
            .ignoresSafeArea(.all)
            
            Form {
                ColorPicker("Select Start Color", selection: $viewModel.startColor)
                ColorPicker("Select End Color", selection: $viewModel.endColor)
                
                Picker("Start Point", selection: $viewModel.startPoint) {
                    ForEach(viewModel.startPointsChoices) { choice in
                        Text(choice.title).tag(choice)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("End Point", selection: $viewModel.endPoint) {
                    ForEach(viewModel.endPointsChoices) { choice in
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
