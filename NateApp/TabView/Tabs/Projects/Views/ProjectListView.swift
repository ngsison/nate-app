//
//  ProjectListView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/28/23.
//

import SwiftUI

struct ProjectListView: View {
    @State var featureCategories = FeatureCategory.allFeatureCategories
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                Section("apps") {
                    ProjectCell(appName: "CircleIn", appIcon: "app-icon-circlein", workDuration: "Jun 2021 - Present")
                    ProjectCell(appName: "GCash", appIcon: "app-icon-gcash", workDuration: "Dec 2018 - Jun 2021")
                    ProjectCell(appName: "EZman", appIcon: "app-icon-ezman-customer", workDuration: "Feb 2020 - Aug 2021")
                    ProjectCell(appName: "EZman Rider", appIcon: "app-icon-ezman-rider", workDuration: "Feb 2020 - Aug 2021")
                }
                
                ForEach(featureCategories, id: \.self) { featureCategory in
                    Section(featureCategory.title.rawValue) {
                        ForEach(featureCategory.features, id: \.title) { feature in
                            FeatureCell(navigationPath: $navigationPath, feature: feature)
                        }
                    }
                }
                
                Section("sample codes") {
                    Text("WIP")
                }
            }
            .padding(.vertical)
            .navigationTitle("Projects")
            .navigationDestination(for: Feature.self) { feature in
                FeatureDetailView(feature: feature)
            }
        }
    }
}

struct ProjectListPreview: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}

fileprivate struct ProjectCell: View {
    var appName: String
    var appIcon: String
    var workDuration: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(appIcon)
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFit()
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appName)
                    .font(.body)
                Text(workDuration)
                    .font(.caption)
            }
        }
    }
}

fileprivate struct FeatureCell: View {
    @Binding var navigationPath: NavigationPath
    var feature: Feature

    var body: some View {
        Button {
            navigationPath.append(feature)
        } label: {
            Text(feature.title.rawValue).foregroundColor(.primary)
        }
    }
}
