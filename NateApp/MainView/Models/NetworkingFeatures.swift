//
//  NetworkingFeatures.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/14/23.
//

import Foundation

enum NetworkingFeatures: Feature, CaseIterable {
    case githubApi
    
    var title: String {
        switch self {
        case .githubApi:
            return "GitHub Public API"
        }
    }
}
