//
//  FeatureCategories.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

protocol Feature {
    var title: String { get }
}

protocol FeatureCategory {
    var title: String { get }
    var features: [Feature] { get }
}

enum FeatureCategories: FeatureCategory, CaseIterable {
    case ui
    case networking
    
    var title: String {
        switch self {
        case .ui:
            return "UI Features"
        case .networking:
            return "Networking Features"
        }
    }
    
    var features: [Feature] {
        switch self {
        case .ui:
            return UIFeatures.allCases
        case .networking:
            return NetworkingFeatures.allCases
        }
    }
}
