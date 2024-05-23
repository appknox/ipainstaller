#import <dlfcn.h>
#import "UIDevice-Capabilities.h"
#import <rootless.h>

@implementation UIDevice (Capabilities)

static BOOL (*MGGetBoolAnswer)(NSString *capability);

- (BOOL) supportsCapability: (NSString *) capability {
    if (!MGGetBoolAnswer) {
        void *libMobileGestalt = dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_LAZY);
        if (libMobileGestalt) {
            MGGetBoolAnswer = dlsym(libMobileGestalt, "MGGetBoolAnswer");
        }
    }
    
    if (MGGetBoolAnswer != NULL) {
        if ([capability isEqual:@"nfc"]){
            NSLog(@"Returning True and Install the app anyway regardless of the NFC Capability");
            return YES;
        } else {
            return MGGetBoolAnswer(capability);
        }
    }
    
    return NO;
}

@end
