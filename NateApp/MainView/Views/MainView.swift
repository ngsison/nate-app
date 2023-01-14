//
//  MainView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                FeatureListView(viewModel: viewModel)
                    .navigationDestination(for: Feature.self) { feature in
                        FeatureDetailView(feature: feature)
                    }
                
                Text("App Version: 1")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct FeatureCell: View {
    let feature: Feature
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        Button {
            viewModel.navigationPath.append(feature)
        } label: {
            Text(feature.title)
        }
        .foregroundColor(.primary)
    }
}

struct FeatureListView: View {
    @StateObject var viewModel: MainViewModel
    var body: some View {
        List {
            ForEach(viewModel.featureCategories, id: \.title) { featureCategory in
                Section(featureCategory.title) {
                    ForEach(featureCategory.features, id: \.title) { feature in
                        FeatureCell(feature: feature, viewModel: viewModel)
                    }
                }
            }
        }
        .navigationTitle("Features")
    }
}

struct FeatureDetailView: View {
    let feature: Feature
    var body: some View {
        ZStack {
            switch feature.title {
            case "Gradients":
                GradientView()
            default:
                Text(feature.title)
            }
        }
        .navigationTitle(feature.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
