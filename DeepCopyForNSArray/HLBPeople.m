//
//  HLBPeople.m
//  DeepCopyForNSArray
//
//  Created by HuangLibo on 2019/11/27.
//  Copyright © 2019 HuangLibo. All rights reserved.
//

#import "HLBPeople.h"

@implementation HLBPeople

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    HLBPeople *people = [[HLBPeople allocWithZone:zone] init];
    people.name = self.name;
    return people;
}

@end
