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
                        AboutHeaderView().padding(.horizontal)
                        Divider().padding(.horizontal)
                        
                        SkillsView().padding(.horizontal)
                        Divider().padding(.horizontal)
                        
                        ExperiencesView().padding(.horizontal)
                        Divider().padding(.horizontal)
                        
                        EducationView().padding(.horizontal)
                        Divider().padding(.horizontal)
                        
                        SpeakingEngagementsView()
                    }
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
