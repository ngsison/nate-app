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
                FeatureList(viewModel: viewModel)
                    .navigationDestination(for: Feature.self) { feature in
                        Text(feature.title)
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

struct FeatureList: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.featureCategories, id: \.title) { featureCategory in
                Section(featureCategory.title) {
                    ForEach(featureCategory.features, id: \.title) { feature in
                        NavigationLink(value: feature) {
                            Text(feature.title)
                        }
                    }
                }
            }
        }
        .navigationTitle("Features")
    }
}
