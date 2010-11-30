// THIS FILE IS GENERATED. DO NOT EDIT.

#import "Expect.h"
#import "ExpectacularFailure.h"

@interface Expect (Private)
+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual;
+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual tolerance:(NSString *)tolerance;
@end

@implementation Expect

#pragma mark char

+ (void)char:(char)expected toEqual:(char)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%c", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%c", actual]];
}

+ (void)char:(char)expected toNotEqual:(char)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%c", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%c", actual]];
}

+ (void)char:(char)expected toBeLessThan:(char)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%c", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%c", actual]];
}

+ (void)char:(char)expected toBeGreaterThan:(char)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%c", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%c", actual]];
}

#pragma mark int

+ (void)int:(int)expected toEqual:(int)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)int:(int)expected toNotEqual:(int)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)int:(int)expected toBeLessThan:(int)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)int:(int)expected toBeGreaterThan:(int)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

#pragma mark short

+ (void)short:(short)expected toEqual:(short)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)short:(short)expected toNotEqual:(short)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)short:(short)expected toBeLessThan:(short)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)short:(short)expected toBeGreaterThan:(short)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

#pragma mark long

+ (void)long:(long)expected toEqual:(long)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)long:(long)expected toNotEqual:(long)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)long:(long)expected toBeLessThan:(long)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)long:(long)expected toBeGreaterThan:(long)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

#pragma mark long long

+ (void)longLong:(long long)expected toEqual:(long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)longLong:(long long)expected toNotEqual:(long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)longLong:(long long)expected toBeLessThan:(long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

+ (void)longLong:(long long)expected toBeGreaterThan:(long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%d", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%d", actual]];
}

#pragma mark unsigned char

+ (void)unsignedChar:(unsigned char)expected toEqual:(unsigned char)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedChar:(unsigned char)expected toNotEqual:(unsigned char)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedChar:(unsigned char)expected toBeLessThan:(unsigned char)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedChar:(unsigned char)expected toBeGreaterThan:(unsigned char)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

#pragma mark unsigned int

+ (void)unsignedInt:(unsigned int)expected toEqual:(unsigned int)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedInt:(unsigned int)expected toNotEqual:(unsigned int)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedInt:(unsigned int)expected toBeLessThan:(unsigned int)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedInt:(unsigned int)expected toBeGreaterThan:(unsigned int)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

#pragma mark unsigned short

+ (void)unsignedShort:(unsigned short)expected toEqual:(unsigned short)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedShort:(unsigned short)expected toNotEqual:(unsigned short)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedShort:(unsigned short)expected toBeLessThan:(unsigned short)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedShort:(unsigned short)expected toBeGreaterThan:(unsigned short)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

#pragma mark unsigned long

+ (void)unsignedLong:(unsigned long)expected toEqual:(unsigned long)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLong:(unsigned long)expected toNotEqual:(unsigned long)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLong:(unsigned long)expected toBeLessThan:(unsigned long)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLong:(unsigned long)expected toBeGreaterThan:(unsigned long)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

#pragma mark unsigned long long

+ (void)unsignedLongLong:(unsigned long long)expected toEqual:(unsigned long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLongLong:(unsigned long long)expected toNotEqual:(unsigned long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLongLong:(unsigned long long)expected toBeLessThan:(unsigned long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

+ (void)unsignedLongLong:(unsigned long long)expected toBeGreaterThan:(unsigned long long)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%u", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%u", actual]];
}

#pragma mark float

+ (void)float:(float)expected toEqual:(float)actual tolerance:(float)tolerance {
    [Expect matchesPredicate:^BOOL{ return ABS(expected - actual) <= tolerance; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%f", actual]
                   tolerance:[NSString stringWithFormat:@"%f", tolerance]];
}

+ (void)float:(float)expected toNotEqual:(float)actual tolerance:(float)tolerance {
    [Expect matchesPredicate:^BOOL{ return ABS(expected - actual) > tolerance; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%f", actual]
                   tolerance:[NSString stringWithFormat:@"%f", tolerance]];
}

+ (void)float:(float)expected toBeLessThan:(float)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%f", actual]];
}

+ (void)float:(float)expected toBeGreaterThan:(float)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%f", actual]];
}

#pragma mark double

+ (void)double:(double)expected toEqual:(double)actual tolerance:(double)tolerance {
    [Expect matchesPredicate:^BOOL{ return ABS(expected - actual) <= tolerance; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to equal"
                      actual:[NSString stringWithFormat:@"%f", actual]
                   tolerance:[NSString stringWithFormat:@"%f", tolerance]];
}

+ (void)double:(double)expected toNotEqual:(double)actual tolerance:(double)tolerance {
    [Expect matchesPredicate:^BOOL{ return ABS(expected - actual) > tolerance; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to not equal"
                      actual:[NSString stringWithFormat:@"%f", actual]
                   tolerance:[NSString stringWithFormat:@"%f", tolerance]];
}

+ (void)double:(double)expected toBeLessThan:(double)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to be less than"
                      actual:[NSString stringWithFormat:@"%f", actual]];
}

+ (void)double:(double)expected toBeGreaterThan:(double)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSString stringWithFormat:@"%f", expected]
                     matcher:@"to be greater than"
                      actual:[NSString stringWithFormat:@"%f", actual]];
}

#pragma mark bool

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

#pragma mark object

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

+ (void)object:(NSObject *)expected toNotEqual:(NSObject *)actual {
    if (expected == nil && actual == nil) {
        @throw [ExpectacularFailure expected:@"nil"
                                     matcher:@"to not equal"
                                      actual:@"nil"];
    } else if (expected == nil && actual != nil) {
        // ok
    } else if (expected != nil && actual == nil) {
        // ok
    } else if ([expected isEqual:actual]) {
        @throw [ExpectacularFailure expected:[expected description]
                                     matcher:@"to not equal"
                                      actual:[actual description]];        
    }
}

+ (void)objectToBeNil:(id)expected {
    if (expected != nil) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto be nil", [expected description]];
    }
}

+ (void)objectToNotBeNil:(id)expected {
    if (expected == nil) {
        @throw [ExpectacularFailure messageWithFormat:@"expected object to not be nil"];
    }
}

#pragma mark block

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

#pragma mark array

+ (void)array:(NSArray *)array toContainObject:(id)object {
    if (![array containsObject:object]) {
        @throw [ExpectacularFailure expected:[array description]
                                     matcher:@"to contain object"
                                      actual:[object description]];
    }
}

+ (void)array:(NSArray *)array toNotContainObject:(id)object {
    if ([array containsObject:object]) {
        @throw [ExpectacularFailure expected:[array description]
                                     matcher:@"to not contain object"
                                      actual:[object description]];
    }
}

+ (void)array:(NSArray *)array toContainObjects:(id)object, ... {
    NSMutableArray *unexpected = [NSMutableArray array];
    NSMutableArray *actual = [NSMutableArray array];

    va_list args;
    va_start(args, object);
    id obj;
    for (obj = object; obj != nil; obj = va_arg(args, id)) {
        [actual addObject:obj];

        if (![array containsObject:obj]) {
            [unexpected addObject:obj];
        }
    }
    va_end(args);

    if ([unexpected count] > 0) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto contain objects: %@\nunexpected objects: %@", array, actual, unexpected];
    }
}

+ (void)array:(NSArray *)array toNotContainObjects:(id)object, ... {
    NSMutableArray *unexpected = [NSMutableArray array];
    NSMutableArray *actual = [NSMutableArray array];

    va_list args;
    va_start(args, object);
    id obj;
    for (obj = object; obj != nil; obj = va_arg(args, id)) {
        [actual addObject:obj];

        if ([array containsObject:obj]) {
            [unexpected addObject:obj];
        }
    }
    va_end(args);

    if ([unexpected count] > 0) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto not contain objects: %@\nunexpected objects: %@", array, actual, unexpected];
    }    
}

#pragma mark predicate

+ (void)predicateToBeTrue:(BOOL (^)())predicate {
    if (!predicate()) {
        @throw [ExpectacularFailure messageWithFormat:@"expected predicate to be true"];
    }
}

+ (void)predicateToBeFalse:(BOOL (^)())predicate {
    if (predicate()) {
        @throw [ExpectacularFailure messageWithFormat:@"expected predicate to be false"];
    }
}

#pragma mark private

+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual {
    if (!predicate()) {
        @throw [ExpectacularFailure expected:expected
                                     matcher:matcher 
                                      actual:actual];
    }
}

+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual tolerance:(NSString *)tolerance {
    if (!predicate()) {
        @throw [ExpectacularFailure expected:expected
                                     matcher:matcher 
                                      actual:actual
                                   tolerance:tolerance];
    }
}

@end
