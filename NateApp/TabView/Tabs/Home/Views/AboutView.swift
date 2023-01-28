//
//  AboutView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/20/23.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [colorScheme == .dark ? .black : .white,
                                        colorScheme == .dark ? .gray  : .white],
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
                    Menu {
                        Toggle(isOn: $isDarkMode) {
                            Label("Dark mode", systemImage: "moon")
                        }
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onAppear {
            isDarkMode = colorScheme == .dark
        }
    }
}

struct AboutPreview: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
