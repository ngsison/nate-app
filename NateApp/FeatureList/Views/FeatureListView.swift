//
//  FeatureListView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import SwiftUI

struct FeatureListView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            FeatureList(viewModel: viewModel)
        }
    }
}

struct FeatureListPreview: PreviewProvider {
    static var previews: some View {
        FeatureListView()
    }
}

fileprivate struct FeatureList: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.featureCategories, id: \.self) { featureCategory in
                Section(featureCategory.title.rawValue) {
                    ForEach(featureCategory.features, id: \.title) { feature in
                        FeatureCell(viewModel: viewModel, feature: feature)
                    }
                }
            }
        }
        .navigationTitle("Features")
        .navigationDestination(for: Feature.self) { feature in
            FeatureDetailView(feature: feature)
        }
    }
}

fileprivate struct FeatureCell: View {
    @ObservedObject var viewModel: MainViewModel
    var feature: Feature

    var body: some View {
        Button {
            viewModel.navigationPath.append(feature)
        } label: {
            Text(feature.title.rawValue).foregroundColor(.primary)
        }
    }
}
