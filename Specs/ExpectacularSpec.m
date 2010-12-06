#import <Cedar-iPhone/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest-iPhone/OCHamcrest.h>
#import <OCMock-iPhone/OCMock.h>
#import "Expect.h"

SPEC_BEGIN(ExpectacularSpec)

describe(@"Expect", ^{
    
#pragma mark block
    
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
    
#pragma mark object
    
    describe(@"object", ^{
        describe(@"toEqual", ^{
            it(@"should pass if both objects are equal", ^{
                [Expect blockToNotThrowException:^{
                    [Expect object:@"foo" toEqual:@"foo"];
                }];
            });
            
            it(@"should fail if both objects are not equal", ^{
                [Expect block:^{
                    [Expect object:@"foo" toEqual:@"bar"];
                } toThrowExceptionWithReason:@"expected: foo\nto equal: bar"];
            });
            
            it(@"should pass if both objects are nil", ^{
                [Expect blockToNotThrowException:^{
                    [Expect object:nil toEqual:nil];
                }];
            });
            
            it(@"should fail if the first object is nil but the second isn't", ^{
                [Expect block:^{
                    [Expect object:nil toEqual:@"bar"];
                } toThrowExceptionWithReason:@"expected: nil\nto equal: bar"];
            });

            it(@"should fail if the first object is not nil but the second is", ^{
                [Expect block:^{
                    [Expect object:@"foo" toEqual:nil];
                } toThrowExceptionWithReason:@"expected: foo\nto equal: nil"];
            });
        });
        
        describe(@"toNotEqual", ^{
            it(@"should fail if both objects are equal", ^{
                [Expect block:^{
                    [Expect object:@"foo" toNotEqual:@"foo"];
                } toThrowExceptionWithReason:@"expected: foo\nto not equal: foo"];
            });
            
            it(@"should pass if both objects are not equal", ^{
                [Expect blockToNotThrowException:^{
                    [Expect object:@"foo" toNotEqual:@"bar"];
                }];
            });
            
            it(@"should fail if both objects are nil", ^{
                [Expect block:^{
                    [Expect object:nil toNotEqual:nil];
                } toThrowExceptionWithReason:@"expected: nil\nto not equal: nil"];
            });
            
            it(@"should pass if the first object is nil but the second isn't", ^{
                [Expect blockToNotThrowException:^{
                    [Expect object:nil toNotEqual:@"bar"];
                }];
            });
            
            it(@"should pass if the first object is not nil but the second is", ^{
                [Expect blockToNotThrowException:^{
                    [Expect object:@"foo" toNotEqual:nil];
                }];
            });
            
        });
        
        describe(@"toBeNil", ^{
            it(@"should pass if the object is nil", ^{
                [Expect blockToNotThrowException:^{
                    id obj = nil;
                    [Expect objectToBeNil:obj];
                }];
            });
            
            it(@"should fail if the object is not nil", ^{
                [Expect block:^{
                    id obj = @"foo";
                    [Expect objectToBeNil:obj];
                } toThrowExceptionWithReason:@"expected: foo\nto be nil"];
            });
        });

        describe(@"toNotBeNil", ^{
            it(@"should pass if the object is not nil", ^{
                [Expect blockToNotThrowException:^{
                    id obj = @"foo";
                    [Expect objectToNotBeNil:obj];
                }];
            });
            
            it(@"should fail if the object is nil", ^{
                [Expect block:^{
                    id obj = nil;
                    [Expect objectToNotBeNil:obj];
                } toThrowExceptionWithReason:@"expected object to not be nil"];
            });
        });
    });
    
#pragma mark BOOL
    
    describe(@"BOOL", ^{
        describe(@"toEqual", ^{
            it(@"should pass if both BOOLs are the same", ^{
                [Expect blockToNotThrowException:^{
                    [Expect bool:YES toEqual:YES];
                }];
            });
            
            it(@"should fail if both BOOLs are not the same", ^{
                [Expect block:^{
                    [Expect bool:YES toEqual:NO];
                } toThrowExceptionWithReason:@"expected: YES\nto equal: NO"];
            });
        });
    });
    
#pragma mark int
    
    describe(@"int", ^{
        describe(@"toEqual", ^{
            it(@"shoud pass if both ints are the same", ^{
                [Expect blockToNotThrowException:^{
                    [Expect int:1 toEqual:1];
                }];
            });
            
            it(@"should fail if both ints are not the same", ^{
                [Expect block:^{
                    [Expect int:1 toEqual:2];
                } toThrowExceptionWithReason:@"expected: 1\nto equal: 2"];
            });            
        });
        
        describe(@"toNotEqual", ^{
            it(@"should fail if both ints are the same", ^{
                [Expect block:^{
                    [Expect int:1 toNotEqual:1];
                } toThrowExceptionWithReason:@"expected: 1\nto not equal: 1"];
            });
            
            it(@"should pass if both ints are not the same", ^{
                [Expect blockToNotThrowException:^{
                    [Expect int:1 toNotEqual:2];
                }];
            });
        });
        
        describe(@"toBeLessThan", ^{
            it(@"should pass if expected < actual", ^{
                [Expect blockToNotThrowException:^{
                    [Expect int:1 toBeLessThan:2];
                }];
            });
            
            it(@"should fail if expected >= actual", ^{
                [Expect block:^{
                    [Expect int:2 toBeLessThan:1];
                } toThrowExceptionWithReason:@"expected: 2\nto be less than: 1"];
            });
        });

        describe(@"toBeGreaterThan", ^{
            it(@"should pass if expected > actual", ^{
                [Expect blockToNotThrowException:^{
                    [Expect int:2 toBeGreaterThan:1];
                }];
            });
            
            it(@"should fail if expected <= actual", ^{
                [Expect block:^{
                    [Expect int:1 toBeGreaterThan:2];
                } toThrowExceptionWithReason:@"expected: 1\nto be greater than: 2"];
            });
        });
        
    });
    
#pragma mark float
    
    describe(@"float", ^{
        describe(@"toEqual", ^{
            it(@"shoud pass if both floats are equal (within the tolerance)", ^{
                [Expect blockToNotThrowException:^{
                    [Expect float:1.0 toEqual:1.001 tolerance:0.01];
                }];
            });
            
            it(@"should fail if both floats are not equal (not within the tolerance)", ^{
                [Expect block:^{
                    [Expect float:1.0 toEqual:1.001 tolerance:0.0001];
                } toThrowExceptionWithReason:@"expected: 1.000000\nto equal: 1.001000\nwith tolerance: 0.000100"];
            });            
        });
        
        describe(@"toNotEqual", ^{
            it(@"should fail if both floats are the same (within the tolerance)", ^{
                [Expect block:^{
                    [Expect float:1.0 toNotEqual:1.001 tolerance:0.01];
                } toThrowExceptionWithReason:@"expected: 1.000000\nto not equal: 1.001000\nwith tolerance: 0.010000"];
            });
            
            it(@"should pass if both floats are not the same (not within the tolerance)", ^{
                [Expect blockToNotThrowException:^{
                    [Expect float:1.0 toNotEqual:1.001 tolerance:0.0001];
                }];
            });
        });
    });
    
#pragma mark array
    
    describe(@"array", ^{
        __block NSArray *a;
        
        beforeEach(^{
            a = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];            
        });
        
        describe(@"toContainObject", ^{
            it(@"should pass if the array contains the object", ^{
                [Expect blockToNotThrowException:^{
                    [Expect array:a toContainObject:@"two"];
                }];
            });
            
            it(@"should fail if the array does not contain the object", ^{
                [Expect block:^{
                    [Expect array:a toContainObject:@"four"];
                } toThrowExceptionWithReason:@"expected: (\n    one,\n    two,\n    three\n)\nto contain object: four"];
            });
        });
        
        describe(@"toNotContainObject", ^{
            it(@"should pass if the array does not contain the object", ^{
                [Expect blockToNotThrowException:^{
                    [Expect array:a toNotContainObject:@"four"];
                }];
            });
            
            it(@"should fail if the array does contain the object", ^{
                [Expect block:^{
                    [Expect array:a toNotContainObject:@"two"];
                } toThrowExceptionWithReason:@"expected: (\n    one,\n    two,\n    three\n)\nto not contain object: two"];
            });
        });

        describe(@"toContainObjects", ^{
            it(@"should pass if the array contains the objects", ^{
                [Expect blockToNotThrowException:^{
                    [Expect array:a toContainObjects:@"two", @"three", nil];
                }];
            });
            
            it(@"should fail if the array does not contain the objects", ^{
                [Expect block:^{
                    [Expect array:a toContainObjects:@"three", @"four", nil];
                } toThrowExceptionWithReason:@"expected: (\n    one,\n    two,\n    three\n)\nto contain objects: (\n    three,\n    four\n)\nunexpected objects: (\n    four\n)"];
            });
        });
        
        describe(@"toNotContainObjects", ^{
            it(@"should pass if the array does not contain the objects", ^{
                [Expect blockToNotThrowException:^{
                    [Expect array:a toNotContainObjects:@"four", @"five", nil];
                }];
            });
            
            it(@"should fail if the array does contain the objects", ^{
                [Expect block:^{
                    [Expect array:a toNotContainObjects:@"two", @"four", nil];
                } toThrowExceptionWithReason:@"expected: (\n    one,\n    two,\n    three\n)\nto not contain objects: (\n    two,\n    four\n)\nunexpected objects: (\n    two\n)"];
            });
        });
    });
    
#pragma mark string
    
    describe(@"string", ^{
        describe(@"toHavePrefix", ^{
            it(@"should pass if the string begins with the expected string", ^{
                [Expect blockToNotThrowException:^{
                    [Expect string:@"peanut" toHavePrefix:@"pea"];
                }];
            });
            
            it(@"should fail if the string does not start with the expected string", ^{
                [Expect block:^{
                    [Expect string:@"peanut" toHavePrefix:@"coco"];
                } toThrowExceptionWithReason:@"expected: peanut\nto have prefix: coco"];
            });
        });

        describe(@"toNotHavePrefix", ^{
            it(@"should pass if the string does not start with the expected string", ^{
                [Expect blockToNotThrowException:^{
                    [Expect string:@"peanut" toNotHavePrefix:@"coco"];
                }];
            });
            
            it(@"should fail if the string does start with the expected string", ^{
                [Expect block:^{
                    [Expect string:@"peanut" toNotHavePrefix:@"pea"];
                } toThrowExceptionWithReason:@"expected: peanut\nto not have prefix: pea"];
            });
        });

        describe(@"toHaveSuffix", ^{
            it(@"should pass if the string ends with the expected string", ^{
                [Expect blockToNotThrowException:^{
                    [Expect string:@"peanut" toHaveSuffix:@"nut"];
                }];
            });
            
            it(@"should fail if the string does not end with the expected string", ^{
                [Expect block:^{
                    [Expect string:@"peanut" toHaveSuffix:@"soup"];
                } toThrowExceptionWithReason:@"expected: peanut\nto have suffix: soup"];
            });
        });
        
        describe(@"toNotHaveSuffix", ^{
            it(@"should pass if the string does not end with the expected string", ^{
                [Expect blockToNotThrowException:^{
                    [Expect string:@"peanut" toNotHaveSuffix:@"soup"];
                }];
            });
            
            it(@"should fail if the string does end with the expected string", ^{
                [Expect block:^{
                    [Expect string:@"peanut" toNotHaveSuffix:@"nut"];
                } toThrowExceptionWithReason:@"expected: peanut\nto not have suffix: nut"];
            });
        });
    });
    
#pragma mark predicate
    
    describe(@"predicate", ^{
        describe(@"predicateToBeTrue", ^{
            it(@"should pass if the predicate is true", ^{
                [Expect blockToNotThrowException:^{
                    [Expect predicateToBeTrue:^BOOL { return YES; }];
                }];
            });
            
            it(@"should fail if the predicate is false", ^{
                [Expect block:^{
                    [Expect predicateToBeTrue:^BOOL { return NO; }];
                } toThrowExceptionWithReason:@"expected predicate to be true"];
            });
        });
        
        describe(@"predicateToBeFalse", ^{
            it(@"should pass if the predicate is false", ^{
                [Expect blockToNotThrowException:^{
                    [Expect predicateToBeFalse:^BOOL { return NO; }];
                }];
            });
            
            it(@"should fail if the predicate is true", ^{
                [Expect block:^{
                    [Expect predicateToBeFalse:^BOOL { return YES; }];
                } toThrowExceptionWithReason:@"expected predicate to be false"];
            });
        });
    });
    
});

SPEC_END
