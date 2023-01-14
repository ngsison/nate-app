//
//  Feature.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

enum UIFeatures: Feature, CaseIterable {
    case chart
    case photoPicker
    
    var title: String {
        switch self {
        case .chart:
            return "Chart"
        case .photoPicker:
            return "UIKit PhotoPicker"
        }
    }
}
