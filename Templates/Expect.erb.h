#import <Foundation/Foundation.h>

@interface Expect : NSObject

#pragma mark bool 

+ (void)bool:(BOOL)expected toEqual:(BOOL)actual;

+ (void)bool:(BOOL)expected toNotEqual:(BOOL)actual;

<% @integer_types.each do |type| %>
#pragma mark <%= type[:type] %>
    <% @integer_matchers.each do |matcher| %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual;
    <% end %>
<% end %>

<% @non_integer_types.each do |type| %>
#pragma mark <%= type[:type] %>
    <% @non_integer_matchers.each do |matcher| %>
        <% if matcher[:tolerance] %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual tolerance:(<%= type[:type] %>)tolerance;
        <% else %>
+ (void)<%= type[:name] %>:(<%= type[:type] %>)expected <%= matcher[:matcher] %>:(<%= type[:type] %>)actual;
        <% end %>
    <% end %>
<% end %>

#pragma mark object

+ (void)object:(NSObject *)expected toEqual:(NSObject *)actual;

+ (void)object:(NSObject *)expected toNotEqual:(NSObject *)actual;

+ (void)objectToBeNil:(id)expected;

+ (void)objectToNotBeNil:(id)expected;
    
#pragma mark block

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;

+ (void)blockToNotThrowException:(void (^)())block;

#pragma mark array

+ (void)array:(NSArray *)array toContainObject:(id)object;

+ (void)array:(NSArray *)array toNotContainObject:(id)object;

+ (void)array:(NSArray *)array toContainObjects:(id)object, ...;

+ (void)array:(NSArray *)array toNotContainObjects:(id)object, ...;

#pragma mark string

+ (void)string:(NSString *)string toHavePrefix:(NSString *)prefix;

+ (void)string:(NSString *)string toNotHavePrefix:(NSString *)prefix;

+ (void)string:(NSString *)string toHaveSuffix:(NSString *)suffix;

+ (void)string:(NSString *)string toNotHaveSuffix:(NSString *)suffix;

#pragma mark predicate

+ (void)predicateToBeTrue:(BOOL (^)())predicate;

+ (void)predicateToBeFalse:(BOOL (^)())predicate;

@end
