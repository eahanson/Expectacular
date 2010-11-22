#import <Cedar-iPhone/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest-iPhone/OCHamcrest.h>
#import <OCMock-iPhone/OCMock.h>
#import "Expect.h"

SPEC_BEGIN(ExpectacularSpec)

describe(@"Expect", ^{
    describe(@"block", ^{
        describe(@"toThrow", ^{
            it(@"should pass if the block throws", ^{
                @try {
                    void(^b)(void) = ^(void){ @throw [NSException exceptionWithName:@"e" reason:@"reason" userInfo:nil]; };
                    [Expect block:b toThrowExceptionWithReason:@"reason"];
                } @catch (id exception) {
                    fail(@"should not have failed");
                }
            });
            
            it(@"should fail if the block does not throw", ^{
                @try {
                    [Expect block:^{} toThrowExceptionWithReason:@"reason"];
                    fail(@"expected exception");
                } @catch (id exception) {
                    [Expect object:[exception reason] toEqual:@"expected block to throw exception with reason: reason"];
                }                
            });
            
            it(@"should fail if the block throws an exception with the wrong reason", ^{
                @try {
                    void(^b)(void) = ^(void){ @throw [NSException exceptionWithName:@"e" reason:@"some other reason" userInfo:nil]; };
                    [Expect block:b toThrowExceptionWithReason:@"reason"];
                } @catch (id exception) {
                    [Expect object:[exception reason] toEqual:@"expected block to throw exception with reason: reason\nbut it threw exception with reason: some other reason"];
                }
            });
        });
        
        describe(@"notToThrow", ^{
            it(@"should pass if the block does not throw", ^{
                @try {
                    [Expect blockToNotThrowException:^{}];
                } @catch (id exception) {
                    fail(@"should not have failed");
                }                
            });
            
            it(@"should fail if the block does throw", ^{
                @try {
                    void(^b)(void) = ^(void){ @throw [NSException exceptionWithName:@"e" reason:@"reason" userInfo:nil]; };
                    [Expect blockToNotThrowException:b];
                    fail(@"expected exception");
                } @catch (id exception) {
                    [Expect object:[exception reason] toEqual:@"expected block to not throw exception\nbut it threw exception with reason: reason"];
                }
            });
        });
    });
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
