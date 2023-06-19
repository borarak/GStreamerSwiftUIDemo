//
//  ContentView.swift
//  GStreamerSwiftUIDemo
//
//  Created by Raktim Bora on 14.06.23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var camViewController:CameraViewController
    
    init() {
        self.camViewController = CameraViewController(camUIView: UIView())
    }
    
    func play_stream(){
        self.camViewController.play()
    }
    
    
    func pause_stream(){
        self.camViewController.pause()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                CameraContainerView(camContainerViewController: self.camViewController).padding(.all, 20)
                Spacer()
                GStreamerStatusMessageView(camContainerViewController: self.camViewController)
                HStack(spacing: 10){
                    Button{
                        play_stream()
                    }label: {
                        Image(systemName: "play")
                    }.padding()
                    Button{
                        pause_stream()
                    }label: {
                        Image(systemName: "pause")
                    }.padding()
                }.frame(height: CGFloat(geometry.size.height * 0.10))
                    .disabled(!self.camViewController.gStreamerInitializationStatus)
            }.position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        
        
    }
    
    
}


struct CameraContainerView:View{
    @ObservedObject var camContainerViewController:CameraViewController
    var body: some View{
        Group{
            if camContainerViewController.gstBackend != nil{
                CameraView(placeholderView: camContainerViewController.camUIView)
                
            } else {
                let _ = camContainerViewController.initBackend()
                Text("Initializing GStreamer, please wait...").frame(alignment: .center)
            }
        }
        
    }
}


struct GStreamerStatusMessageView: View{
    @ObservedObject var camContainerViewController:CameraViewController
    var body: some View{
        if self.camContainerViewController.gStreamerInitializationStatus, let msg = self.camContainerViewController.messageFromGstBackend{
            Text(msg)
        }else{
            EmptyView()
        }
        
    }
}


//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
