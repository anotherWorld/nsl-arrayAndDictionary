//
//  NSArray+String.m
//  CZSG
//
//  Created by BW on 14/12/25.
//  Copyright (c) 2014年 bw. All rights reserved.
//

#import "NSArray+String.h"

@implementation NSArray (String)

- (NSString *)description {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]) {
            
            [array addObject:obj];
        }
        else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            
            [array addObject:[obj descriptionWithIndex:1]];
        }
        else {
            
            [array addObject:[obj description]];
        }
    }];
    return [NSString stringWithFormat:@"(\n\t%@\n)", [array componentsJoinedByString:@",\n\t"]];
}

- (NSString *)descriptionWithIndex:(NSInteger)index {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    while (string.length < index) {
        
        [string appendFormat:@"\t"];
    }
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]) {
            
            [array addObject:obj];
        }
        else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            
            [array addObject:[obj descriptionWithIndex:index + 1]];
        }
        else {
            
            [array addObject:[obj description]];
        }
    }];
    return [NSString stringWithFormat:@"\n%@(\n%@%@\n%@)", string, string, [array componentsJoinedByString:[NSString stringWithFormat:@",%@\n\t", string]], string];
}

@end
