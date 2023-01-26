//
//  SpeakingEngagementsView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/27/23.
//

import SwiftUI

struct SpeakingEngagementsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🔈 Speaking Engagements")
                .font(.system(size: 20, weight: .medium))
                .padding([.horizontal, .bottom])
            
            Event(title: "Microsoft Cognitive Services",
                  eventName: "Programmers / Developers Meetup 3",
                  image: "event-microsoft",
                  caption: "One of the audience testing the app I created on my first talk and live coding demo at Microsoft PH :)",
                  location: "Microsoft Philippines",
                  date: "March 26, 2017")
            
            Event(title: "Microsoft App Center",
                  eventName: "MondPH DevOps Session",
                  image: "event-app-center",
                  caption: #"After-event photo at Microsoft PH where I demoed "Continuous Delivery" using Microsoft App Center"#,
                  location: "Microsoft Philippines",
                  date: "July 16, 2017")
        }
    }
}

fileprivate struct Event: View {
    var title: String
    var eventName: String
    var image: String
    var caption: String
    var location: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                
                Text(eventName)
                    .font(.system(size: 16))
            }
            .padding(.horizontal)
            
            Image(image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(caption)
                    .font(.system(size: 14))
                
                Text(date)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text(location)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
        }
    }
}
