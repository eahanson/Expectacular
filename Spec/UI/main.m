//
//  main.m
//  Expectacular
//
//  Created by Erik Hanson on 11/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int retVal = UIApplicationMain(argc, argv, nil, @"CedarApplicationDelegate");
    [pool release];
    return retVal;
}
