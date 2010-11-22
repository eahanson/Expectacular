#import "Expect.h"
#import "ExpectacularFailure.h"

@interface Expect (Private)
+ (void)intMatchesPredicate:(BOOL (^)())predicate expected:(int)expected matcher:(NSString *)matcher actual:(int)actual;
@end

@implementation Expect

+ (void)int:(int)expected toEqual:(int)actual {
    [Expect intMatchesPredicate:^BOOL{ return expected == actual; } expected:expected matcher:@"to equal" actual:actual];
//    [Expect object:[NSNumber numberWithInt:expected] toEqual:[NSNumber numberWithInt:actual]];
}
    
+ (void)int:(int)expected toNotEqual:(int)actual {
    [Expect intMatchesPredicate:^BOOL{ return expected != actual; } expected:expected matcher:@"to not equal" actual:actual];
}
    
+ (void)int:(int)expected toBeLessThan:(int)actual {
    [Expect intMatchesPredicate:^BOOL{ return expected < actual; } expected:expected matcher:@"to be less than" actual:actual];
}

+ (void)int:(int)expected toBeGreaterThan:(int)actual {
    [Expect intMatchesPredicate:^BOOL{ return expected > actual; } expected:expected matcher:@"to be greater than" actual:actual];
}

+ (void)intMatchesPredicate:(BOOL (^)())predicate expected:(int)expected matcher:(NSString *)matcher actual:(int)actual {
    if (!predicate()) {
        @throw [ExpectacularFailure expected:[[NSNumber numberWithInt:expected] stringValue]
                                     matcher:matcher
                                      actual:[[NSNumber numberWithInt:actual] stringValue]];
    }
}


+ (void)bool:(BOOL)expected toEqual:(BOOL)actual {
    if (expected != actual) {
        @throw [ExpectacularFailure expected:(expected ? @"YES" : @"NO") 
                                     matcher:@"to equal" 
                                      actual:(actual ? @"YES" : @"NO")];
    }    
}

+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual {
    if (expected == actual) {
        @throw [ExpectacularFailure expected:(expected ? @"YES" : @"NO")
                                     matcher:@"to not equal"
                                      actual:(actual ? @"YES" : @"NO")];
    }    
}


+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual {
    if (expected == nil && actual == nil) {
        // ok
    } else if (expected == nil && actual != nil) {
        @throw [ExpectacularFailure expected:@"nil"
                                     matcher:@"to equal"
                                      actual:[actual description]];
    } else if (expected != nil && actual == nil) {
        @throw [ExpectacularFailure expected:[expected description]
                                     matcher:@"to equal"
                                      actual:@"nil"];        
    } else if (![expected isEqual:actual]) {
        @throw [ExpectacularFailure expected:[expected description]
                                     matcher:@"to equal"
                                      actual:[actual description]];        
    }
}

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason {
    BOOL threw = NO;
    
    @try {
        block();
        threw = NO;
    } @catch (id exception) {
        threw = YES;
        
        if (![reason isEqual:[exception reason]]) {
            @throw [ExpectacularFailure messageWithFormat:@"expected block to throw exception with reason: %@\nbut it threw exception with reason: %@", reason, [exception reason]];
        }
    }
    
    if (!threw) {
        @throw [ExpectacularFailure messageWithFormat:@"expected block to throw exception with reason: %@", reason];
    }
}

+ (void)blockToNotThrowException:(void (^)())block {
    @try {
        block();
    } @catch (id exception) {
        @throw [ExpectacularFailure messageWithFormat:@"expected block to not throw exception\nbut it threw exception with reason: %@", [exception reason]];
    }
}

@end
