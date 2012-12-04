//
//  GraphAppViewController.m
//  GrapSampleProject
//
//  Created by Rahul Nair on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphAppViewController.h"
#import "GraphCanvasView.h"
#import "GraphAppModal.h"

@interface GraphAppViewController ()

@end

@implementation GraphAppViewController
@synthesize mainView;

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    GraphCanvasView *graphCanvas = [[GraphCanvasView alloc]init];
    [graphCanvas setFrame:CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height) ];

    NSArray *percentValueOfStudent_RED = [[NSArray alloc]initWithObjects:[NSNumber numberWithInteger:50],[NSNumber numberWithInteger:50],[NSNumber numberWithInteger:40],[NSNumber numberWithInteger:25],[NSNumber numberWithInteger:10], nil];
    NSArray *percentValueOfStudent_BLUE = [[NSArray alloc]initWithObjects:[NSNumber numberWithInteger:70],[NSNumber numberWithInteger:80],[NSNumber numberWithInteger:60],[NSNumber numberWithInteger:55],[NSNumber numberWithInteger:80], nil];
    
    NSArray *percentValueOfStudent_YELLOW = [[NSArray alloc]initWithObjects:[NSNumber numberWithInteger:5],[NSNumber numberWithInteger:10],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:40],[NSNumber numberWithInteger:75] ,[NSNumber numberWithInteger:15],nil];
   
    

    
    [graphCanvas setFrame:CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height) ];
    [graphCanvas setNumber_of_point_to_plot:[percentValueOfStudent_YELLOW count]];
   
    graphCanvas.max_percent_val =  100;
    
    
    for (int i = 0 ; i <= graphCanvas.number_of_point_to_plot-1; i++) {
        [graphCanvas.footerTitles addObject:[NSString stringWithFormat:@"Class%d",i]];
    }

   
    GraphAppModal *graphModal_RED = [[GraphAppModal alloc]initWithName:@"$2" colorOfBar:[UIColor colorWithRed:212.0/255.0 green:100.0/255.0 blue:95/255.0 alpha:1] contentArray:percentValueOfStudent_RED];
    GraphAppModal *graphModal_BLUE = [[GraphAppModal alloc]initWithName:@"$3" colorOfBar:[UIColor colorWithRed:101.0/255.0 green:145.0/255.0 blue:216.0/255.0 alpha:1 ] contentArray:percentValueOfStudent_BLUE];
    GraphAppModal *graphModal_YELLOW = [[GraphAppModal alloc]initWithName:@"$3" colorOfBar:[UIColor colorWithRed:253/255.0 green:209.0/255.0 blue:6.0/255.0 alpha:1 ] contentArray:percentValueOfStudent_YELLOW];
     GraphAppModal *graphModal_Green = [[GraphAppModal alloc]initWithName:@"$3" colorOfBar:[UIColor colorWithRed:153/255.0 green:109.0/255.0 blue:6.0/255.0 alpha:1 ] contentArray:percentValueOfStudent_YELLOW];
    [graphCanvas addValuesInArray:graphModal_RED andColorOfBar:nil];
    [graphCanvas addValuesInArray:graphModal_BLUE andColorOfBar:nil];
    [graphCanvas addValuesInArray:graphModal_YELLOW andColorOfBar:nil];
   // [graphCanvas addValuesInArray:graphModal_Green andColorOfBar:nil];


    
    [graphCanvas setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:graphCanvas];
    
   
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMainView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
