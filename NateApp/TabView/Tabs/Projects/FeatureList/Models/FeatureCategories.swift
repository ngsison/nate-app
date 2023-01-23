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

enum FeatureTitle: String, CaseIterable {
    
    // MARK: - UI Features
    case animations = "Animations"
    case charts = "Charts"
    case customShapes = "Custom Shapes"
    case gradients = "Gradients"
    case maps = "Maps"
    case photoPicker = "PhotoPicker"
    
    // MARK: - Networking Features
    case githubApi = "GitHub Sample API"
    
    var category: FeatureCategoryTitle {
        switch self {
        case .animations,
                .charts,
                .customShapes,
                .gradients,
                .maps,
                .photoPicker:
            return .ui
            
        case .githubApi:
            return .networking
        }
    }
}

struct Feature: Hashable {
    var title: FeatureTitle
}

struct FeatureCategory: Hashable {
    var title: FeatureCategoryTitle
    var features: [Feature]
    
    static var allFeatureCategories = FeatureCategoryTitle.allCases.map { featureCategoryTitle in
        
        let features = FeatureTitle.allCases
            .filter { $0.category == featureCategoryTitle }
            .map { Feature(title: $0) }
        
        return FeatureCategory(title: featureCategoryTitle, features: features)
    }
}
