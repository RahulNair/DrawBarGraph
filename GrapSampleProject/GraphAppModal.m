//
//  GraphAppModal.m
//  GrapSampleProject
//
//  Created by Rahul Nair on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphAppModal.h"

@implementation GraphAppModal
@synthesize colorOfBar;
@synthesize arrayWithValue;
@synthesize name;

-(id)initWithName:(NSString *)name_ colorOfBar:(UIColor *)color contentArray:(NSArray *)array{
    if (self = [super init]) {
        self.arrayWithValue = [[NSMutableArray alloc]init];
        [self.arrayWithValue addObject:array];
        self.colorOfBar = color;
        self.name = name_;
    }
    return self;
}

-(id)initWithName:(NSString *)name_ colorOfBar:(UIColor *)color contentdictionary:(NSMutableDictionary *)array{
    
    if (self = [super init]) {
        self.arrayWithValue = [[NSMutableArray alloc]init];
        [ self.arrayWithValue addObject:array];
        self.colorOfBar = color;
        self.name = name_;
    }
    return self;
}
@end

