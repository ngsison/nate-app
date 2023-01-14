//
//  FeatureCategories.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

struct Feature: Hashable {
    var title: String
}

struct FeatureCategory: Hashable {
    var title: String
    var features: [Feature]
    
    static var allFeatureCategories = [FeatureCategory(title: "UI Features",            features: [Feature(title: "Chart"),
                                                                                                   Feature(title: "Gradients"),
                                                                                                   Feature(title: "External Links"),
                                                                                                   Feature(title: "UIKit PhotoPicker")]),
                                       
                                       FeatureCategory(title: "Networking Features",    features: [Feature(title: "GitHub Sample API"),
                                                                                                   Feature(title: "File Download")])]
}
