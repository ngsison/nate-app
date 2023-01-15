//
//  FeatureDetailView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

struct FeatureDetailView: View {
    var feature: Feature
    var body: some View {
        ZStack {
            switch feature.title {
            case .charts:
                ChartView()
            case .gradients:
                GradientView()
            case .photoPicker:
                PhotoPickerView()
            default:
                Text(feature.title.rawValue)
            }
        }
        .navigationTitle(feature.title.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeatureDetailPreview: PreviewProvider {
    static var previews: some View {
        FeatureDetailView(feature: Feature(title: .charts))
    }
}
