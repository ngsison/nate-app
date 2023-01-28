//
//  MainTabView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/22/23.
//

import SwiftUI

struct MainTabView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        TabView {
            AboutView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProjectListView()
                .tabItem {
                    Label("Projects", systemImage: "latch.2.case")
                }
            
            Text("Contact")
                .tabItem {
                    Label("Contact", systemImage: "person")
                }
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

struct MainTabPreview: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
