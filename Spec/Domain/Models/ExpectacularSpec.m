//
//  ExpectacularSpec.m
//  Expectacular
//
//  Created by Erik Hanson on 11/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cedar-iPhone/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest-iPhone/OCHamcrest.h>
#import <OCMock-iPhone/OCMock.h>
#import "Expect.h"

SPEC_BEGIN(ExpectacularSpec)

describe(@"Expect", ^{
    describe(@"object", ^{
        describe(@"toEqual", ^{
            it(@"should pass if both objects are equal", ^{
                @try {
                    [Expect object:@"foo" toEqual:@"foo"];
                } @catch (id exception) {
                    fail(@"should not have failed");
                }
            });
            
            it(@"should fail if both objects are not equal", ^{
                @try {
                    [Expect object:@"foo" toEqual:@"bar"];
                    fail(@"expected exception");
                } @catch (id exception) {
                    assertThat([exception reason], equalTo(@"expected: foo\nto equal: bar"));
                }
            });
            
            it(@"should pass if both objects are nil", ^{
                @try {
                    [Expect object:nil toEqual:nil];
                } @catch (id exception) {
                    fail(@"should not have failed");
                }
            });
            
            it(@"should fail if the first object is nil but the second isn't", ^{
                @try {
                    [Expect object:nil toEqual:@"bar"];
                    fail(@"expected exception");
                } @catch (id exception) {
                    assertThat([exception reason], equalTo(@"expected: nil\nto equal: bar"));
                }
            });

            it(@"should fail if the first object is not nil but the second is", ^{
                @try {
                    [Expect object:@"foo" toEqual:nil];
                    fail(@"expected exception");
                } @catch (id exception) {
                    assertThat([exception reason], equalTo(@"expected: foo\nto equal: nil"));
                }
            });
        });
    });
    
    describe(@"int", ^{
        describe(@"toEqual", ^{
            it(@"shoud pass if both ints are the same", ^{
                @try {
                    [Expect int:1 toEqual:1];
                } @catch (id exception) {
                    fail(@"should not have failed");
                }
            });
            
            it(@"should fail if both ints are not the same", ^{
                @try {
                    [Expect int:1 toEqual:2];
                    fail(@"expected exception");
                } @catch (id exception) {
                    [Expect object:[exception reason] toEqual:@"expected: 1\nto equal: 2"];
                }
            });            
        });
    });
    
});

SPEC_END
