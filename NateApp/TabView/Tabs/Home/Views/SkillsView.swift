//
//  SkillsView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/27/23.
//

import SwiftUI

struct SkillsView: View {
   private let columns = [GridItem(.fixed(80)),
                          GridItem(.fixed(80)),
                          GridItem(.fixed(80)),
                          GridItem(.fixed(80))]
   
   var body: some View {
       VStack(alignment: .leading, spacing: 20) {
           Text("⚡️ Skills")
               .font(.system(size: 20, weight: .medium))
           
           LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
               SkillView(title: "Swift", systemImageName: "swift", imageColor: .red)
               SkillView(title: "SwiftUI", systemImageName: "swift", imageColor: .blue)
               SkillView(title: "Git", imageName: "git")
               SkillView(title: "Jira", imageName: "jira")
               SkillView(title: "Javascript", titleSize: 10, imageName: "javascript")
               SkillView(title: "React Native", titleSize: 10, imageName: "react-native")
               SkillView(title: "Public\nSpeaking", titleSize: 10, systemImageName: "megaphone.fill", imageColor: .cyan)
           }
       }
   }
}

fileprivate struct SkillView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var title: String
    var titleSize: CGFloat = 14
    var imageName: String? = nil
    var systemImageName: String? = nil
    var imageColor: Color = .clear
    
    func imageView() -> Image? {
        if let systemImageName {
            return Image(systemName: systemImageName)
        } else if let imageName {
            return Image(imageName)
        } else {
            return nil
        }
    }
    
    var body: some View {
        ZStack {
            colorScheme == .dark ? Color.gray : Color.white
            
            VStack(spacing: 10) {
                imageView()?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(imageColor)
                
                Text(title)
                    .font(.system(size: titleSize, weight: .regular))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .padding(.horizontal, 4)
            }
        }
        .frame(width: 70, height: 70)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
    }
}
