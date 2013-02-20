//
//  FWViewController.m
//  Firework2
//
//  Created by 遠山 晃 on 02/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FWViewController.h"
#import "FWView.h"

@interface FWViewController ()
{
}

@end

@implementation FWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [(FWView *) self.view stop];
}


@end