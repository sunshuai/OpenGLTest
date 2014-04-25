//
//  SectionViewController.m
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-26.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import "SectionViewController.h"
#import "ARView.h"
#import "ContentView.h"
#import "PlaceOfInterest.h"

@interface SectionViewController ()<ContentViewDelegate>
{
    ARView *arView ;
    NSMutableArray *cubes;
}

@end

@implementation SectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    arView = [[ARView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:arView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(40, 20, 200, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"返回上个页面" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(disView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    CLLocationCoordinate2D poiCoords[] = {{120.7711329, 66.9741874},
        {-79.7690400, -122.4835193},
        {70.5068670, -0.1708030},
        {0.5126399, 100.6802448},
        {-130.4152519, -3.6887466}};
    
    int numPois = sizeof(poiCoords) / sizeof(CLLocationCoordinate2D);
    
	cubes = [[NSMutableArray alloc] initWithCapacity:0];
    
	for (int i = 0; i < numPois; i++) {
        
        
        ContentView *view = [[ContentView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        view.mViewId_Str = [NSString stringWithFormat:@"这是立方体:%d",i];
        view.tag = i;
//        view.m_backImageName = @"icon.png";
        view.target = self;
        
        PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:view at:[[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude]];
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
-(void)viewTouchHandle:(id)sender
{
    ContentView *contentView = (ContentView *)sender;
    NSLog(@"====== %@",contentView.mViewId_Str);
//    PlaceOfInterest *interest = (PlaceOfInterest *)[cubes objectAtIndex:contentView.tag];
//    ContentView *view = (ContentView *)[interest view];
//    view.m_backImageName = @"bamboo.png";
//    [cubes removeObjectAtIndex:contentView.tag];
//    
//    [arView setPlacesOfInterest:cubes];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"what you want?" message:contentView.mViewId_Str delegate:nil cancelButtonTitle:@"NothingToDo" otherButtonTitles: nil];
    [alert show];
    
    
}

-(void)disView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
