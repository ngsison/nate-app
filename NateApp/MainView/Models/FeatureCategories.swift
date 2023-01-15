//
//  FeatureCategories.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

enum FeatureCategoryTitle: String, CaseIterable {
    case ui = "UI Features"
    case networking = "Networking Features"
}

enum FeatureTitle: String {
    case charts = "Charts"
    case gradients = "Gradients"
    case externalLinks = "External Links"
    case photoPicker = "PhotoPicker"
    case githubApi = "GitHub Sample API"
    case fileDownload = "File Download"
    case maps = "Maps"
}

struct Feature: Hashable {
    var title: FeatureTitle
}

struct FeatureCategory: Hashable {
    var title: FeatureCategoryTitle
    var features: [Feature]
    
    static var allFeatureCategories = FeatureCategoryTitle.allCases
        .map { featureCategoryTitle in
            var features: [Feature]
            
            switch featureCategoryTitle {
            case .ui:
                features = [Feature(title: .charts),
                            Feature(title: .gradients),
                            Feature(title: .externalLinks),
                            Feature(title: .photoPicker),
                            Feature(title: .maps)]
            case .networking:
                features = [Feature(title: .githubApi),
                            Feature(title: .fileDownload)]
            }
            
            return FeatureCategory(title: featureCategoryTitle, features: features)
        }
}
