//
//  CameraViewController.swift
//  GStreamerSwiftUIDemo
//
//  Created by Raktim Bora on 19.06.23.
//

import Foundation
import UIKit
import Dispatch
import SwiftUI


@objc class CameraViewController: NSObject, GStreamerBackendProtocol, ObservableObject{
    
    var gstBackend:GStreamerBackend?
    var camUIView:UIView
    @Published var gStreamerInitializationStatus:Bool = false
    @Published var messageFromGstBackend:String?
    
    init(camUIView:UIView) {
        self.camUIView = camUIView
    }
    
    func initBackend(){
        self.gstBackend = GStreamerBackend(self, videoView: self.camUIView)
        let queue = DispatchQueue(label: "run_app_q")
        queue.async{
            self.gstBackend?.run_app_pipeline_threaded()
        }
        return
    }
    
    func play(){
        if gstBackend == nil{
            self.initBackend()
        }
        self.gstBackend!.play()
    }
    
    func pause(){
        self.gstBackend!.pause()
    }
    
    @objc func gStreamerInitialized() {
        self.gStreamerInitializationStatus = true
    }
    
    @objc func gstreamerSetUIMessageWithMessage(message: String) {
        self.messageFromGstBackend = message
    }
    
    
}
