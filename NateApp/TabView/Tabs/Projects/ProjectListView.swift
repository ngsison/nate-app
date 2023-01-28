//
//  ProjectListView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/28/23.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("apps") {
                    ProjectCell(appName: "CircleIn", appIcon: "app-icon-circlein", workDuration: "Jun 2021 - Present")
                    ProjectCell(appName: "GCash", appIcon: "app-icon-gcash", workDuration: "Dec 2018 - Jun 2021")
                    ProjectCell(appName: "EZman", appIcon: "app-icon-ezman-customer", workDuration: "Feb 2020 - Aug 2021")
                    ProjectCell(appName: "EZman Rider", appIcon: "app-icon-ezman-rider", workDuration: "Feb 2020 - Aug 2021")
                }
                
                Section("features") {
                    Text("WIP")
                }
                
                Section("sample codes") {
                    Text("WIP")
                }
            }
            .padding(.vertical)
            .navigationTitle("Projects")
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
