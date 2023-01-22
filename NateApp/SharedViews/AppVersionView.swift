//
//  AppVersionView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/22/23.
//

import SwiftUI

struct AppVersionView: View {
    var body: some View {
        Text("v\(Common.appVersion)-\(Common.buildNumber)")
            .font(.footnote)
    }
}
