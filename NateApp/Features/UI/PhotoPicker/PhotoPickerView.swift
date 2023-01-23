//
//  PhotoPickerView.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

fileprivate let defaultProfileImage = UIImage(systemName: "person")!.withRenderingMode(.alwaysTemplate)

struct PhotoPickerView: View {
    @State private var photoPickerPresented = false
    @State private var profileImage = defaultProfileImage
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ZStack {
                    Color.black.opacity(0.1)
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .padding(profileImage == defaultProfileImage ? 24 : 0)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            photoPickerPresented = true
                        }
                }
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    OnlineIndicator()
                        .frame(width: 20, height: 20)
                        .offset(x: -4, y: -4)
                }
                
                Button("Tap to Select Photo") {
                    photoPickerPresented = true
                }
            }
        }
        .sheet(isPresented: $photoPickerPresented) {
            PhotoPicker(selectedImage: $profileImage)
        }
    }
    
}

struct PhotoPickerPreview: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}

fileprivate struct OnlineIndicator: View {
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .clipShape(Circle())
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            }
    }
}

