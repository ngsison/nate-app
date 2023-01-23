//
//  AboutView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/20/23.
//

import SwiftUI
import StepperView

struct AboutView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var userColorScheme: ColorScheme?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [userColorScheme == .dark ? .black : .white,
                                        userColorScheme == .dark ? .gray  : .white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Header()
                        Divider()
                        Skills()
                        Divider()
                        Experiences()
                        Divider()
                        Education()
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical)
                    .navigationTitle("About Me")
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        guard let oldUserColorScheme = userColorScheme else { return }
                        if oldUserColorScheme == .dark {
                            userColorScheme = .light
                        } else {
                            userColorScheme = .dark
                        }
                    } label: {
                        Image(systemName: userColorScheme == .dark ? "sun.max" : "moon")
                    }
                }
            }
        }
        .preferredColorScheme(userColorScheme ?? colorScheme)
        .onAppear {
            userColorScheme = colorScheme
        }
    }
}

struct AboutPreview: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

fileprivate struct Header: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nathaniel Brion Sison")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.primary)
                    
                    Text("iOS Developer")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "location.circle")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Text("Tarlac, Philippines")
                            .font(.system(size: 12, weight: .regular))
                    }
                    .foregroundColor(.primary.opacity(0.6))
                }
            }
            
            Text("More than 6 years of experience in Software Development, specializing in iOS.")
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.primary)
        }
    }
}

fileprivate struct Skills: View {
    private let columns = [GridItem(.fixed(80)),
                           GridItem(.fixed(80)),
                           GridItem(.fixed(80))]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("⚡️ Skills")
                .font(.system(size: 20, weight: .medium))
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
                SkillView(title: "Swift", systemImageName: "swift", imageColor: .red)
                SkillView(title: "SwiftUI", systemImageName: "swift", imageColor: .blue)
                SkillView(title: "Git", systemImageName: "arrow.triangle.branch", imageColor: Color(hex: "515151"))
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
    var imageColor: Color
    
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

fileprivate struct Experiences: View {
    let steps = [Experience(jobTitle: "Freelance iOS Developer", companyName: "Upwork", year: "May 2021 - Present"),
                 Experience(jobTitle: "Lead iOS Engineer", companyName: "GCash", year: "Dec 2018 - June 2021"),
                 Experience(jobTitle: "Lead Mobile App Developer", companyName: "TAP Services, Inc.", year: "2017-2018"),
                 Experience(jobTitle: "Junior .NET Developer", companyName: "Smart Communications, Inc.", year: "2016 - 2017"),
                 Experience(jobTitle: "Student Partner", companyName: "Microsoft", year: "2015 - 2016")]
    
    let indicationTypes = [StepperIndicationType.custom(NumberedCircleView(text: "4")),
                           .custom(NumberedCircleView(text: "3")),
                           .custom(NumberedCircleView(text: "2")),
                           .custom(NumberedCircleView(text: "1")),
                           .custom(NumberedCircleView(text: "-"))]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("💻 Work Experience")
                .font(.system(size: 20, weight: .medium))
            
            StepperView()
                .addSteps(steps)
                .indicators(indicationTypes)
                .stepIndicatorMode(.vertical)
                .spacing(24)
                .lineOptions(.custom(1, .gray))
                .stepperEdgeInsets(EdgeInsets(.zero))
        }
    }
}

fileprivate struct Experience: View {
    var jobTitle: String
    var companyName: String
    var year: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(jobTitle)
                .font(.system(size: 16, weight: .medium))
            
            Text(companyName)
                .font(.system(size: 16))
            
            Text(year)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
        }
    }
}

fileprivate struct Education: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🎓 Education")
                .font(.system(size: 24, weight: .medium))
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
