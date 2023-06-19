//
//  CameraView.swift
//  GStreamerSwiftUIDemo
//
//  Created by Raktim Bora on 14.06.23.
//

import SwiftUI

struct CameraView: UIViewRepresentable {
    
    var placeholderView:UIView
    
    init(placeholderView: UIView) {
        self.placeholderView = placeholderView
    }
    
    func makeUIView(context: Context) -> some UIView {
        return placeholderView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
