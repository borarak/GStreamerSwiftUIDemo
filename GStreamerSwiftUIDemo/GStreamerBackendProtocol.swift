//
//  GStreamerBackendProtocol.swift
//  GStreamerSwiftUIDemo
//
//  Created by Raktim Bora on 19.06.23.
//

import Foundation


protocol GStreamerBackendProtocol{
    func gStreamerInitialized()
    func gstreamerSetUIMessageWithMessage(message: String)
}

