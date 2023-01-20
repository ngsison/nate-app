//
//  AboutView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/20/23.
//

import SwiftUI
import StepperView

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private func isDarkMode() -> Bool {
        colorScheme == .dark
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [isDarkMode() ? .black : .white , .gray],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Header()
                            Skills()
                            Experiences()
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical)
                        .navigationTitle("About Me")
                    }
                    .scrollIndicators(.hidden)
                    
                    Text("v\(Common.appVersion)-\(Common.buildNumber)")
                        .font(.footnote)
                        .padding(.bottom)
                }
            }
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
        VStack(alignment: .leading) {
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
                .padding(.top)
        }
    }
}

fileprivate struct Skills: View {
    private let columns = [GridItem(.fixed(80)),
                           GridItem(.fixed(80)),
                           GridItem(.fixed(80))]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Skills")
                .font(.headline)
                .padding(.top)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                SkillView(title: "Swift", imageName: "swift", imageColor: .red)
                SkillView(title: "SwiftUI", imageName: "swift", imageColor: .blue)
                SkillView(title: "Git", imageName: "arrow.triangle.branch", imageColor: .gray)
            }
        }
    }
}

fileprivate struct SkillView: View {
    
    var title: String
    var imageName: String
    var imageColor: Color
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(imageColor)
                
                Text(title)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black)
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
        VStack(alignment: .leading) {
            Text("Experience")
                .font(.headline)
                .padding(.top)
            
            StepperView()
                .addSteps(steps)
                .indicators(indicationTypes)
                .stepIndicatorMode(.vertical)
                .spacing(30)
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
                .font(.system(size: 16))
                .foregroundColor(.secondary)
            
        }
    }
}
