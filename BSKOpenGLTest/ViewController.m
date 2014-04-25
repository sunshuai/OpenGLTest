//
//  ViewController.m
//  BSKOpenGLTest
//
//  Created by Moses on 13-12-26.
//  Copyright (c) 2013年 孙帅. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
}

-(void)buttonPressedgetIn:(id)sender
{
    FirstViewController *first = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [self presentViewController:first animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
