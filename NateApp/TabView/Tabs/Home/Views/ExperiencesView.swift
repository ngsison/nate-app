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
    var linePosition: LinePosition
    var lineWidth: CGFloat = 1
    var lineColor: Color = .gray
}

enum LinePosition {
    case top
    case mid
    case bottom
}

struct ExperiencesView: View {
    let logoSize: CGFloat = 50
    
    let experiences = [Experience(jobTitle: "Freelance iOS Developer", companyName: "Upwork", companyImage: "upwork", year: "May 2021 - Present"),
                       Experience(jobTitle: "Lead iOS Engineer", companyName: "GCash", companyImage: "gcash", year: "Dec 2018 - June 2021"),
                       Experience(jobTitle: "Lead Mobile App Developer", companyName: "TAP Services, Inc.", companyImage: "tap", year: "2017-2018"),
                       Experience(jobTitle: "Junior .NET Developer", companyName: "Smart Communications, Inc.", companyImage: "smart", year: "2016 - 2017"),
                       Experience(jobTitle: "Student Partner", companyName: "Microsoft", companyImage: "microsoft", year: "2015 - 2016")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("💻 Work Experience")
                .font(.system(size: 20, weight: .medium))
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0 ..< experiences.count, id: \.self) { i in
                    ExperienceView(experience: experiences[i],
                                   companyLogo: CompanyLogo(size: logoSize,
                                                            imageName: experiences[i].companyImage,
                                                            linePosition: i == 0
                                                            ? .bottom
                                                            : i == experiences.count - 1
                                                            ? .top
                                                            : .mid))
                }
            }
            .padding(.horizontal, 12)
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
            
            VStack(alignment: .leading, spacing: 4) {
                Text(experience.jobTitle)
                    .font(.system(size: 16, weight: .medium))
                
                Text(experience.companyName)
                    .font(.system(size: 16))
                
                Text(experience.year)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .padding(.vertical)
        }
    }
}

struct CompanyLogoView: View {
    var companyLogo: CompanyLogo
    
    func lineHeight() -> CGFloat {
        switch companyLogo.linePosition {
        case .top:
            return companyLogo.size
        case .mid:
            return companyLogo.size * 2
        case .bottom:
            return companyLogo.size
        }
    }
    
    func lineYOffset() -> CGFloat {
        switch companyLogo.linePosition {
        case .top:
            return -lineHeight()
        case .mid:
            return 0
        case .bottom:
            return lineHeight()
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(companyLogo.lineColor)
                .frame(width: companyLogo.lineWidth, height: lineHeight())
                .offset(x: 0, y: lineYOffset())
            
            Image(companyLogo.imageName)
                .resizable()
                .frame(width: companyLogo.size, height: companyLogo.size)
                .cornerRadius(companyLogo.size / 2)
                .scaledToFit()
        }
    }
}
