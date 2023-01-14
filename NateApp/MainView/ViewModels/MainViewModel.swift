//
//  MainViewModel.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var featureCategories = FeatureCategory.allFeatureCategories
    @Published var navigationPath = NavigationPath()
}
