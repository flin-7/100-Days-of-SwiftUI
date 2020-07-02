//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Felix Lin on 7/2/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
