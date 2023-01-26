//
//  EducationView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/27/23.
//

import SwiftUI

struct EducationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🎓 Education")
                .font(.system(size: 20, weight: .medium))
            School()
            Awards()
        }
    }
}

fileprivate struct School: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Bachelor of Science in Information Technology")
                .font(.system(size: 18, weight: .medium))
            
            Text("Central Luzon State University")
                .font(.system(size: 16))
            
            Text("2011 - 2016")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
    }
}

fileprivate struct Awards: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("⭐️ Awards")
                .font(.system(size: 20, weight: .medium))
            
            Spacer(minLength: 4)
            
            Text("• C Programming Competition🥉 (3rd place)")
                .font(.system(size: 14, weight: .light))
            
            Text("• Microsoft App Dev Challenge🥈(2nd place)")
                .font(.system(size: 14, weight: .light))
            
            Text("• UP-ACM Algolympics 2016 (participant)")
                .font(.system(size: 14, weight: .light))
        }
    }
}
