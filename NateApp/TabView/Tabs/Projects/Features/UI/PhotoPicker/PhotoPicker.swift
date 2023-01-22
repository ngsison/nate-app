//
//  PhotoPicker.swift
//  NateApp
//
//  Created by Nathaniel Brion Sison on 1/15/23.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController

    @Binding var selectedImage: UIImage
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Find out what's the use of this method
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self)
    }
        
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            photoPicker.selectedImage = image
            picker.dismiss(animated: true)
        }
    }
}

