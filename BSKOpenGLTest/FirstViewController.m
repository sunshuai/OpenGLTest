//
//  ViewController.m
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-25.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import "FirstViewController.h"
#import "ARView.h"
#import "ContentView.h"
#import "PlaceOfInterest.h"
#import "AnimationImage.h"
#import "SectionViewController.h"

#define M_TAU (2*M_PI)

@interface FirstViewController ()<UIAlertViewDelegate, AnimationImageDelegate>
{
    ARView *arView ;
    NSMutableArray *cubes;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arView = [[ARView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:arView];
    
    CLLocationCoordinate2D poiCoords[] = {{-70.7711329, -133.9741874},
        {140.7690400, -122.4835193},
        {-150.5068670, -60.1708030},
        {0.5126399, 130.6802448},
        {80.4152519, -3.6887466}};
    
    int numPois = sizeof(poiCoords) / sizeof(CLLocationCoordinate2D);
    
	cubes = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:12];
    for (int i = 0; i<12; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png",i];
        UIImage *Image = [UIImage imageNamed:imageName];
        [array addObject:Image];
    }
    
	for (int i = 0; i < numPois; i++) {

        
//        ContentView *view = [[ContentView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
//        view.mViewId_Str = [NSString stringWithFormat:@"MySelfID:%d",i];
//        view.tag = i;
//        view.m_backImageName = @"flowers.png";
        AnimationImage *image = [[AnimationImage alloc] initWithFrame:CGRectMake(0, 0, 80, 100) withImages:array];
        image.mViewID = [NSString stringWithFormat:@"这是灯笼%d",i];
        image.target = self;
        
        PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:image at:[[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude]];
		[cubes insertObject:poi atIndex:i];
        
	}
    
	[arView setPlacesOfInterest:cubes];
    
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
    //	ARView *arView = (ARView *)self.view;
	[arView start];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    //	ARView *arView = (ARView *)self.view;
	[arView stop];
}

#pragma marl == ARViewDelegate
-(void)ArViewTouchAtPointWith:(id)viewC
{
    ContentView *contentView = (ContentView *)viewC;
    NSLog(@"====== %@",contentView.mViewId_Str);
    PlaceOfInterest *interest = (PlaceOfInterest *)[cubes objectAtIndex:contentView.tag];
    ContentView *view = (ContentView *)[interest view];
    view.m_backImageName = @"bamboo.png";
    [cubes removeObjectAtIndex:contentView.tag];
    
    [arView setPlacesOfInterest:cubes];

}

#pragma mark == AnimationViewDelegate

-(void)animationImageTouch:(id)sender
{
    AnimationImage *imageVi = (AnimationImage *)sender;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"what you want?" message:imageVi.mViewID delegate:self cancelButtonTitle:@"Nothing" otherButtonTitles:@"GO Cube", nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        SectionViewController *section = [[SectionViewController alloc] initWithNibName:@"SectionViewController" bundle:nil];
        [self presentViewController:section animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
