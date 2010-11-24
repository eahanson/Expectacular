
#import <Foundation/Foundation.h>


@interface ExpectacularFailure : NSException {
}

+ (id)expected:(NSString *)expected matcher:(NSString *)matcher actual:(NSString *)actual;
+ (id)messageWithFormat:(NSString *)format, ...;

@end
