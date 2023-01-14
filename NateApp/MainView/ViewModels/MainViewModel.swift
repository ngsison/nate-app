//
//  MainViewModel.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var featureCategories = FeatureCategories.allCases
}
