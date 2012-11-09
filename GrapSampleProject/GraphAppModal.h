//
//  GraphAppModal.h
//  GrapSampleProject
//
//  Created by Rahul Nair on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphAppModal : NSObject

@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSMutableArray *arrayWithValue;
@property(strong,nonatomic)UIColor *colorOfBar;

-(id)initWithName:(NSString *)name_ colorOfBar:(UIColor *)color contentArray:(NSArray *)array;
-(id)initWithName:(NSString *)name_ colorOfBar:(UIColor *)color contentdictionary:(NSMutableDictionary *)array;
@end
