
#import <Foundation/Foundation.h>


@interface ExpectacularFailure : NSException

+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual;
+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual tolerance:(NSString *)tolerance;
+ (id)messageWithFormat:(NSString *)format, ...;

@end
