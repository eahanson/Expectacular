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


#pragma mark block

+ (void)block:(void (^)())block toThrowExceptionWithReason:(NSString *)reason;

+ (void)blockToNotThrowException:(void (^)())block;

@end
