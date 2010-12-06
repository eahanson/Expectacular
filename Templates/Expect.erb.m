// <%= @header_comment %>

#import "Expect.h"
#import "ExpectacularFailure.h"

@interface Expect (Private)
+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual;
+ (void)matchesPredicate:(BOOL (^)())predicate expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual tolerance:(NSString *)tolerance;
@end

@implementation Expect

<% @integer_types.each do |type| %>
#pragma mark <%= type[:type] %>
    <% @integer_matchers.each do |matcher| %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual {
    [Expect matchesPredicate:^BOOL{ <%= matcher[:predicate] %> }
                    expected:[NSString stringWithFormat:@"<%= type[:converter] %>", expected]
                     matcher:@"<%= matcher[:matcher_description] %>"
                      actual:[NSString stringWithFormat:@"<%= type[:converter] %>", actual]];
}
    <% end %>
<% end %>

<% @non_integer_types.each do |type| %>
#pragma mark <%= type[:type] %>
    <% @non_integer_matchers.each do |matcher| %>
        <% if matcher[:tolerance] %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual tolerance:(<%= type[:type] %>)tolerance {
    [Expect matchesPredicate:^BOOL{ <%= matcher[:predicate] %> }
                    expected:[NSString stringWithFormat:@"<%= type[:converter] %>", expected]
                     matcher:@"<%= matcher[:matcher_description] %>"
                      actual:[NSString stringWithFormat:@"<%= type[:converter] %>", actual]
                   tolerance:[NSString stringWithFormat:@"<%= type[:converter] %>", tolerance]];
}
        <% else %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual {
    [Expect matchesPredicate:^BOOL{ <%= matcher[:predicate] %> }
                    expected:[NSString stringWithFormat:@"<%= type[:converter] %>", expected]
                     matcher:@"<%= matcher[:matcher_description] %>"
                      actual:[NSString stringWithFormat:@"<%= type[:converter] %>", actual]];
}
        <% end %>
    <% end %>
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

#pragma mark string

+ (void)string:(NSString *)string toHavePrefix:(NSString *)prefix {
    if (![string hasPrefix:prefix]) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto have prefix: %@", string, prefix];
    }
}

+ (void)string:(NSString *)string toNotHavePrefix:(NSString *)prefix {
    if ([string hasPrefix:prefix]) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto not have prefix: %@", string, prefix];
    }
}

+ (void)string:(NSString *)string toHaveSuffix:(NSString *)suffix {
    if (![string hasSuffix:suffix]) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto have suffix: %@", string, suffix];
    }
}

+ (void)string:(NSString *)string toNotHaveSuffix:(NSString *)suffix {
    if ([string hasSuffix:suffix]) {
        @throw [ExpectacularFailure messageWithFormat:@"expected: %@\nto not have suffix: %@", string, suffix];
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
