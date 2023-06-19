//
//  GStreamerBackend.h
//  GStreamerSwiftUIDemo
//
//  Created by Raktim Bora on 13.06.23.
//

#ifndef GStreamerBackend_h
#define GStreamerBackend_h

#include <stdio.h>
#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GStreamerBackend : NSObject

-(id) init:(id) uiDelegate videoView:(UIView*) video_view;

-(void) play;

-(void) pause;

-(void) run_app_pipeline_threaded;
@end

#endif /* GStreamerBackend_h */
