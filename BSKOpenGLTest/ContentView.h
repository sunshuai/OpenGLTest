//
//  ContentView.h
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-25.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@protocol ContentViewDelegate <NSObject>

-(void)viewTouchHandle:(id)sender;

@end

@interface ContentView : UIView {
    
@private
    /* The pixel dimensions of the backbuffer */
    GLint backingWidth;
    GLint backingHeight;
    
    EAGLContext *context;
    
    /* OpenGL names for the renderbuffer and framebuffers used to render to this view */
    GLuint viewRenderbuffer, viewFramebuffer;
    
    /* OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist) */
    GLuint depthRenderbuffer;
    
    NSTimer *animationTimer;
    NSTimeInterval animationInterval;
	
	GLfloat rota;
}
@property NSTimeInterval animationInterval;
@property (nonatomic, retain) NSString *mViewId_Str;
@property (nonatomic, retain) NSString  *m_backImageName;
@property (nonatomic) id target;
@property (nonatomic) SEL action;

- (void)startAnimation;
- (void)stopAnimation;
- (void)drawView;

- (void)setupView;
- (void)checkGLError:(BOOL)visibleCheck;


@end
