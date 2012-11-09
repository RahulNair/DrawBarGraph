//
//  GraphCanvasView.m
//  GrapSampleProject
//
//  Created by Rahul Nair on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphCanvasView.h"
#import "GraphAppModal.h"


@implementation GraphCanvasView
@synthesize colorOfBarContent,arryOfBarContent,footerTitles;
@synthesize number_of_point_to_plot,max_percent_val;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor: [UIColor whiteColor]];
        arryOfBarContent = [[NSMutableArray alloc]init];
        footerTitles = [[NSMutableArray alloc]init ];
        self.contentMode = UIViewContentModeRedraw;

        
    }
    return self;
}

-(void)addValuesInArray:(GraphAppModal *)graphModal andColorOfBar:(UIColor *)color{
    [arryOfBarContent addObject:graphModal];
    
}


-(void)drawRect:(CGRect)rect{
    
    
    
    int y_Div_val = max_percent_val/10;
    float draw_divider_onY_at_differ_of = max_percent_val/(y_Div_val);
    float dark_val = draw_divider_onY_at_differ_of;
    NSLog(@"------------------- arryOfBarContent count %d",[arryOfBarContent count] );
    NSLog(@"------------------- SELF WIDHT %f",self.frame.size.width/(number_of_point_to_plot * [arryOfBarContent count]-1));
    float barWidth = self.frame.size.width/(number_of_point_to_plot * [arryOfBarContent count]) ;
    
    
    CGFloat _myHeight =self.frame.size.height;
    CGFloat _myWidth = self.frame.size.width ;
    
    
    CGFloat axis_pading = 30.0;
    
    CGFloat _X_axis_x_cord_START_position = axis_pading;  //Xx1
    CGFloat _X_axis_y_cord_START_position = _myHeight-axis_pading;//Xy1
    CGFloat _X_axis_x_cord_END_position = _myWidth-axis_pading;// Xx2
    CGFloat _X_axis_y_cord_END_position = _myHeight-axis_pading;//Xy2
    
    CGFloat _Y_axis_x_cord_END_position = axis_pading;// Yx2
    CGFloat _Y_axis_y_cord_END_position =  _myHeight-axis_pading;//Yy2
    
    CGFloat _length_of_X_axis;
    CGFloat _length_of_Y_axis;
    
    CGContextRef context    = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    ////Y axix
    //    CGContextSetLineWidth(context, 2.0); // Draw them with a 2.0 stroke width so they are a bit more visible.
    //    CGContextMoveToPoint(context, axis_pading,axis_pading); //start at this point
    //    CGContextAddLineToPoint(context, _Y_axis_x_cord_END_position, _Y_axis_y_cord_END_position); //draw to this point
    
    
    ////x axix
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context,_X_axis_x_cord_START_position, _X_axis_y_cord_START_position+1);
    CGContextAddLineToPoint(context,_myWidth-5 , _X_axis_y_cord_END_position+1);
    CGContextStrokePath(context);
    
    //--------------------------------------------------------------------------
    //calculte each percent per pixel on y axis  ^|
    CGFloat X_sqr = _Y_axis_x_cord_END_position - axis_pading;
    X_sqr = X_sqr*X_sqr;
    CGFloat Y_sqr = _Y_axis_y_cord_END_position - _Y_axis_x_cord_END_position;
    Y_sqr = Y_sqr*Y_sqr;
    _length_of_Y_axis = sqrtf(X_sqr+Y_sqr);
    CGFloat _one_percent_eqls_Y_axis = _length_of_Y_axis/max_percent_val;
    
    for (float i = 1; i <= max_percent_val; i++) {
        float y_val = i*_one_percent_eqls_Y_axis;
        if(i == dark_val){
            dark_val = dark_val+draw_divider_onY_at_differ_of;
            CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
            CGContextSetLineWidth(context, 0.5);
            CGContextMoveToPoint(context,_X_axis_x_cord_START_position, _X_axis_y_cord_START_position-y_val);
            CGContextAddLineToPoint(context,_X_axis_x_cord_END_position , _X_axis_y_cord_END_position-y_val);
            CGContextStrokePath(context);
        }else {
            //            CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
            //            CGContextSetLineWidth(context, 0.1);
        }
        
    }
    
    //--------------------------------------------------------------------------
    //calculte each percent per pixel on x axis  ---->
    X_sqr = _X_axis_x_cord_END_position - _X_axis_x_cord_START_position;
    X_sqr = X_sqr*X_sqr;
    Y_sqr = _X_axis_y_cord_END_position - _X_axis_y_cord_START_position;
    Y_sqr = Y_sqr*Y_sqr;
    
    _length_of_X_axis = sqrtf(X_sqr+Y_sqr);
    CGFloat _one_percent_eqls_X_axis = _length_of_X_axis/number_of_point_to_plot;
    
    float start_position ;
    
    if(arryOfBarContent.count > 1){
        start_position = barWidth/arryOfBarContent.count;
        
    }else {
        start_position = barWidth;
    }
    
    
    for (int k = 0; k < arryOfBarContent.count; k++) {
        GraphAppModal *graphModal = [arryOfBarContent objectAtIndex:k];
        UIColor *color = graphModal.colorOfBar;
        NSArray *array = [graphModal.arrayWithValue objectAtIndex:0];
        //NSArray *array = [(NSArray *)arryOfBarContent objectAtIndex:k];
        for (int i = 1; i <= array.count; i++) {
            float x_val = i*_one_percent_eqls_X_axis;
            float percentVal =   [[array objectAtIndex:i-1]floatValue];
            float negation_Of_y_val = max_percent_val - percentVal;
            
            float draw_barWidth = (barWidth)/arryOfBarContent.count;
            
            
            negation_Of_y_val = _one_percent_eqls_Y_axis * negation_Of_y_val;
            
            // CGContextSetStrokeColorWithColor(context, ((UIColor *)[colorOfBarContent objectAtIndex:k]).CGColor);
            CGContextSetStrokeColorWithColor(context, color.CGColor);
            CGContextSetLineWidth(context, draw_barWidth);
            CGContextMoveToPoint(context, ((axis_pading+x_val)+draw_barWidth - 6)-start_position,axis_pading+(negation_Of_y_val)); //start at this point
            CGContextAddLineToPoint(context,((_Y_axis_x_cord_END_position+x_val)+draw_barWidth - 6)-start_position, _Y_axis_y_cord_END_position); //draw to this
            CGContextStrokePath(context);
            //     ----------------------------------------------------------------------------------------------------------
            //            CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
            //            CGContextMoveToPoint(context, (axis_pading+x_val),axis_pading); //start at this point
            //            CGContextAddLineToPoint(context,(_Y_axis_x_cord_END_position+x_val), _Y_axis_y_cord_END_position); //draw to this
            //            CGContextSetLineWidth(context, 0.5);
            //            CGContextStrokePath(context);
            //     ----------------------------------------------------------------------------------------------------------
        }
        start_position = start_position + barWidth/arryOfBarContent.count;
    }
    
    
    if(footerTitles.count > 1){
        
        
        
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, self.bounds.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        
        for (int i = 1; i <= footerTitles.count; i++) {
            float x_val = i*_one_percent_eqls_X_axis;
            float fontSize = 15;
            NSString *name = @"";
            //      name = [footerTitles objectAtIndex:i];
            
            if(i-1 < footerTitles.count){
                //                GraphAppModal *graphModal = [arryOfBarContent objectAtIndex:i-1];
                //                name = graphModal.name;
                name = [footerTitles objectAtIndex:i-1];
            }
            
            
            
            NSString *string = [NSString stringWithFormat:@"%@",name];
            const char *text = [string UTF8String] ;
            CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
            CGContextSelectFont(context, "Helvetica", fontSize, kCGEncodingMacRoman);
            CGContextSetTextDrawingMode(context, kCGTextFill);
            CGContextSetTextPosition(context, (_Y_axis_x_cord_END_position+ x_val - barWidth/2)- fontSize , axis_pading/2 );
            CGContextShowText(context, text , strlen([string UTF8String]));
        }
        
        dark_val = 0;
        float display_value = max_percent_val;
        for (float i = 0; i <= max_percent_val; i++) {
            float y_val = i*_one_percent_eqls_Y_axis;
            float fontSize = 15;
            if(i == dark_val){
                
                NSString *str = [NSString stringWithFormat:@"%0.0f",display_value] ;
                const char *text = [str UTF8String] ;
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica", fontSize, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextSetTextPosition(context, 5,_X_axis_y_cord_START_position-y_val);
                CGContextShowText(context, text ,strlen([str UTF8String]));
                dark_val += draw_divider_onY_at_differ_of;
                display_value -= draw_divider_onY_at_differ_of;
            }
            
        }
        
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////
    
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
