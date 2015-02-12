#import <Cordova/CDVPlugin.h>

@interface CDVTestFairy : CDVPlugin

- (void)begin:(CDVInvokedUrlCommand*)command;
- (void)pushFeedbackController:(CDVInvokedUrlCommand*)command;
- (void)updateLocation:(CDVInvokedUrlCommand*)command;
- (void)checkpoint:(CDVInvokedUrlCommand*)command;
- (void)setCorrelationId:(CDVInvokedUrlCommand*)command;
- (void)pause:(CDVInvokedUrlCommand*)command;
- (void)resume:(CDVInvokedUrlCommand*)command;

@end
