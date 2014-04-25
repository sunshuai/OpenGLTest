//
//  AnimationImage.m
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-26.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import "AnimationImage.h"

@implementation AnimationImage
@synthesize action,mViewID,target;

-(id)initWithFrame:(CGRect)frame withImages:(NSArray *)array
{
    if (self = [super initWithFrame:frame]) {
        
//        NSMutableArray *imgArr = [[NSMutableArray alloc]initWithCapacity:0];
//        for ( int i = 1; i<array.count; i++) {
//            
//            NSString *path = [NSString stringWithFormat:@"pich_deng_%d",i];
//            NSLog(@"%@", path);
//            
//            path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
//            UIImage *img =  [[UIImage alloc] initWithContentsOfFile:path];
//            [imgArr addObject:img];
//            
//        }
        self.animationImages = array;
        self.animationDuration = 0.1*array.count;
        [self startAnimating];
        
        self.userInteractionEnabled=YES;//UIImageView默认是不能响应手势的，需要开启userInteractionEnabled属性。
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)]; //处理单击收拾
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:singleTap];
    }
    return self;
}

-(void)clickImage:(AnimationImage *)imageAni
{
    if ([target conformsToProtocol:@protocol(AnimationImageDelegate)]) {
        [target animationImageTouch:self];
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch iamge");
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
