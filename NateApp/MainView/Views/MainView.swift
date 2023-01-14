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
        NavigationView {
            List {
                ForEach(viewModel.featureCategories, id: \.title) { featureCategory in
                    Section(featureCategory.title) {
                        ForEach(featureCategory.features, id: \.title) { feature in
                            Text(feature.title)
                        }
                    }
                }
            }
            .navigationTitle("Features")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
