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
