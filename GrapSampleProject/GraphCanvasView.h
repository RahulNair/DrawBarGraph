//
//  GraphCanvasView.h
//  GrapSampleProject
//
//  Created by Rahul Nair on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "GraphAppModal.h"


@interface GraphCanvasView : UIView



@property(strong,atomic)NSMutableArray *footerTitles;
@property(strong,atomic)NSMutableArray *arryOfBarContent;
@property(strong,atomic)NSMutableArray *colorOfBarContent;
@property(assign,atomic)NSInteger number_of_point_to_plot;
@property(assign,atomic)NSInteger max_percent_val ;



-(void)addValuesInArray:(GraphAppModal *)graphModal andColorOfBar:(UIColor *)color;
@end
