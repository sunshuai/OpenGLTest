//
//  AnimationImage.h
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-26.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnimationImageDelegate <NSObject>

-(void)animationImageTouch:(id)sender;

@end

@interface AnimationImage : UIImageView

@property (nonatomic) NSMutableArray *mImageArray;
@property (nonatomic) id target;
@property (nonatomic) SEL action;
@property (nonatomic) NSString *mViewID;

-(id)initWithFrame:(CGRect)frame withImages:(NSArray *)array;

@end
