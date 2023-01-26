//
//  ExperiencesView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/27/23.
//

import SwiftUI

struct Experience: Hashable {
    let jobTitle: String
    let companyName: String
    let companyImage: String
    let year: String
}

struct CompanyLogo: Hashable {
    var size: CGFloat
    var imageName: String
}

struct ExperiencesView: View {
    let logoSize: CGFloat = 50
    let spacing: CGFloat = 24
    private let horizontalPadding: CGFloat = 12
    
    let experiences = [Experience(jobTitle: "Freelance iOS Developer", companyName: "Upwork", companyImage: "upwork", year: "May 2021 - Present"),
                       Experience(jobTitle: "Lead iOS Engineer", companyName: "GCash", companyImage: "gcash", year: "Dec 2018 - June 2021"),
                       Experience(jobTitle: "Lead Mobile App Developer", companyName: "TAP Services, Inc.", companyImage: "tap", year: "2017-2018"),
                       Experience(jobTitle: "Junior .NET Developer", companyName: "Smart Communications, Inc.", companyImage: "smart", year: "2016 - 2017"),
                       Experience(jobTitle: "Student Partner", companyName: "Microsoft", companyImage: "microsoft", year: "2015 - 2016")]
    
    func lineHeight() -> CGFloat {
        let totalExperienceViewsHeight = max(logoSize, 62) * CGFloat(experiences.count)
        let totalSpacing = spacing * CGFloat(experiences.count - 1)
        let excessHeight = abs(62 - logoSize)
        
        return totalExperienceViewsHeight + totalSpacing - excessHeight
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("💻 Work Experience")
                .font(.system(size: 20, weight: .medium))
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 1, height: lineHeight())
                    .offset(x: horizontalPadding + (logoSize / 2))
                
                VStack(alignment: .leading, spacing: spacing) {
                    ForEach(0 ..< experiences.count, id: \.self) { i in
                        ExperienceView(experience: experiences[i],
                                       companyLogo: CompanyLogo(size: logoSize,
                                                                imageName: experiences[i].companyImage))
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
        }
    }
}

struct ExperiencesPreview: PreviewProvider {
    static var previews: some View {
        ExperiencesView()
    }
}

struct ExperienceView: View {
    let experience: Experience
    let companyLogo: CompanyLogo
    let spacing: CGFloat = 16
    
    var body: some View {
        HStack(spacing: spacing) {
            CompanyLogoView(companyLogo: companyLogo)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(experience.jobTitle)
                    .font(.system(size: 16, weight: .medium))
                    .frame(height: 16)
                
                Text(experience.companyName)
                    .font(.system(size: 16))
                    .frame(height: 16)
                
                Text(experience.year)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .frame(height: 14)
            }
        }
    }
}

struct CompanyLogoView: View {
    var companyLogo: CompanyLogo
    
    var body: some View {
        Image(companyLogo.imageName)
            .resizable()
            .frame(width: companyLogo.size, height: companyLogo.size)
            .cornerRadius(companyLogo.size / 2)
            .scaledToFit()
    }
}
