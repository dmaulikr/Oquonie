//
//  ViewController.m
//  Oquonie Desktop
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "ViewController.h"

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"
#import "World.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self start];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

-(void)start
{
    NSLog(@"- TMPL | Start");
    self.test1.frame = CGRectMake(0, 0, 100, 100);

    World * worldTest = [[World alloc] init];
}


@end