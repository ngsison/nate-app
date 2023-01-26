//
//  AboutHeaderView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/27/23.
//

import SwiftUI

struct AboutHeaderView: View {
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
