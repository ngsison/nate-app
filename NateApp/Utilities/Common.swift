//
//  Common.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/16/23.
//

import Foundation

struct Common {
    static let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    static let buildNumber: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
}
