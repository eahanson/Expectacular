#import "Expect.h"
#import "ExpectacularFailure.h"

@implementation Expect

+ (void)int:(int)expected toEqual:(int)actual {
    if (expected != actual) {
        @throw [ExpectacularFailure expected:[[NSNumber numberWithInt:expected] stringValue] 
                                     matcher:@"to equal" 
                                      actual:[[NSNumber numberWithInt:actual] stringValue]];
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


@end
