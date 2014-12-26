//
//  NSDictionary+String.m
//  CZSG
//
//  Created by BW on 14/12/25.
//  Copyright (c) 2014年 bw. All rights reserved.
//

#import "NSDictionary+String.h"

@implementation NSDictionary (String)

- (NSString *)description {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]) {
            
            NSString *string = obj;
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
        else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            
            NSString *string = [obj descriptionWithIndex:1];
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
        else {
            
            NSString *string = [obj description];
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
    }];
    NSString *string = [NSString stringWithFormat:@"{\n\t%@\n}", [array componentsJoinedByString:@";\n\t"]];
    return string;
}

- (NSString *)descriptionWithIndex:(NSInteger)index {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    while (string.length < index) {
        
        [string appendFormat:@"\t"];
    }
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]) {
            
            NSString *string = obj;
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
        else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            
            NSString *string = [obj descriptionWithIndex:index + 1];
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
        else {
            
            NSString *string = [obj description];
            [array addObject:[NSString stringWithFormat:@"%@ = %@", key, string]];
        }
    }];
    return [NSString stringWithFormat:@"\n%@{\n%@\t%@\n%@}", string, string, [array componentsJoinedByString:[NSString stringWithFormat:@";\n%@\t", string]], string];
}

@end
