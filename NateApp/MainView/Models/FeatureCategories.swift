//
//  FeatureCategories.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

enum FeatureTitle: String {
    case charts = "Charts"
    case gradients = "Gradients"
    case externalLinks = "External Links"
    case photoPicker = "PhotoPicker"
    case githubApi = "GitHub Sample API"
    case fileDownload = "File Download"
}

struct Feature: Hashable {
    var title: FeatureTitle
}

struct FeatureCategory: Hashable {
    var title: String
    var features: [Feature]
    
    static var allFeatureCategories = [FeatureCategory(title: "UI Features",            features: [Feature(title: .charts),
                                                                                                   Feature(title: .gradients),
                                                                                                   Feature(title: .externalLinks),
                                                                                                   Feature(title: .photoPicker)]),
                                       
                                       FeatureCategory(title: "Networking Features",    features: [Feature(title: .githubApi),
                                                                                                   Feature(title: .fileDownload)])]
}
