#import <Cordova/CDVPlugin.h>

@interface CDVTestFairy : CDVPlugin

- (void)begin:(CDVInvokedUrlCommand*)command;
- (void)pushFeedbackController:(CDVInvokedUrlCommand*)command;
- (void)updateLocation:(CDVInvokedUrlCommand*)command;
- (void)checkpoint:(CDVInvokedUrlCommand*)command;
- (void)setCorrelationId:(CDVInvokedUrlCommand*)command;
- (void)pause:(CDVInvokedUrlCommand*)command;
- (void)resume:(CDVInvokedUrlCommand*)command;
- (void)identify:(CDVInvokedUrlCommand*)command;
- (void)log:(CDVInvokedUrlCommand*)command;
- (void)setServerEndpoint:(CDVInvokedUrlCommand*)command;
- (void)hideWebViewElements:(CDVInvokedUrlCommand*)command;
- (void)sendUserFeedback:(CDVInvokedUrlCommand *)command;
- (void)stop:(CDVInvokedUrlCommand *)command;
- (void)setScreenName:(CDVInvokedUrlCommand *)command;
- (void)setUserId:(CDVInvokedUrlCommand *)command;
- (void)setAttribute:(CDVInvokedUrlCommand *)command;
@end
