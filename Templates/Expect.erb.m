#import "Expect.h"
#import "ExpectacularFailure.h"

@interface Expect (Private)
+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSObject *)expected matcher:(NSString *)matcher actual:(NSObject *)actual;
@end

@implementation Expect

<% ["int"].each do |primitive_type| %>

#pragma mark <%= primitive_type %>

+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toEqual:(<%= primitive_type %>)actual {
    [Expect matchesPredicate:^BOOL{ return expected == actual; }
                    expected:[NSNumber numberWith<%= primitive_type.capitalize %>:expected]
                     matcher:@"to equal"
                      actual:[NSNumber numberWith<%= primitive_type.capitalize %>:actual]];
}

+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toNotEqual:(<%= primitive_type %>)actual {
    [Expect matchesPredicate:^BOOL{ return expected != actual; }
                    expected:[NSNumber numberWith<%= primitive_type.capitalize %>:expected]
                     matcher:@"to not equal"
                      actual:[NSNumber numberWith<%= primitive_type.capitalize %>:actual]];
}

+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toBeLessThan:(<%= primitive_type %>)actual {
    [Expect matchesPredicate:^BOOL{ return expected < actual; }
                    expected:[NSNumber numberWith<%= primitive_type.capitalize %>:expected]
                     matcher:@"to be less than"
                      actual:[NSNumber numberWith<%= primitive_type.capitalize %>:actual]];
}

+ (void)<%= primitive_type %>:(<%= primitive_type %>)expected toBeGreaterThan:(<%= primitive_type %>)actual {
    [Expect matchesPredicate:^BOOL{ return expected > actual; }
                    expected:[NSNumber numberWith<%= primitive_type.capitalize %>:expected]
                     matcher:@"to be greater than"
                      actual:[NSNumber numberWith<%= primitive_type.capitalize %>:actual]];
    
}

<% end %>

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

#pragma mark private

+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSObject *)expected matcher:(NSString *)matcher actual:(NSObject *)actual {
    if (!predicate()) {
        @throw [ExpectacularFailure expected:[NSString stringWithFormat:@"%@", expected]
                                     matcher:matcher 
                                      actual:[NSString stringWithFormat:@"%@", actual]];
    }
}


@end
