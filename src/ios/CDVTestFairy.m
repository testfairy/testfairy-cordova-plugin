#import "CDVTestFairy.h"
#import "TestFairy.h"
#import <CoreLocation/CoreLocation.h>
#import <Cordova/CDVPluginResult.h>

@implementation CDVTestFairy

- (id)init
{
	self = [super init];
	if (self) {
		// Initialization code here.
	}
	
	return self;
}

- (void)begin:(CDVInvokedUrlCommand*)command
{
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		
		NSString *APIKey = [arguments objectAtIndex:0];
		[TestFairy begin:APIKey];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"API Key is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)pushFeedbackController:(CDVInvokedUrlCommand*)command
{
	[TestFairy pushFeedbackController];
	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)updateLocation:(CDVInvokedUrlCommand*)command
{
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0)
	{
		NSDictionary *locationData = [arguments firstObject];
		NSDictionary *coord = [locationData objectForKey:@"coords"];
		CLLocation *location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake([[coord objectForKey:@"latitude"] doubleValue], [[coord objectForKey:@"longitude"] doubleValue])
															 altitude:[[coord objectForKey:@"altitude"] longValue]
												   horizontalAccuracy:[[coord objectForKey:@"accuracy"] longValue]
													 verticalAccuracy:[[coord objectForKey:@"altitudeAccuracy"] doubleValue]
															timestamp:nil];
		[TestFairy updateLocation:[NSArray arrayWithObject:location]];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"location is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)checkpoint:(CDVInvokedUrlCommand*)command
{
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		
		NSString *name = [arguments objectAtIndex:0];
		[TestFairy checkpoint:name];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"name is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setCorrelationId:(CDVInvokedUrlCommand*)command
{
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		
		NSString *correlationId = [arguments objectAtIndex:0];
		[TestFairy setCorrelationId:correlationId];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"correlation ID is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)pause:(CDVInvokedUrlCommand*)command
{
	[TestFairy pause];
	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)resume:(CDVInvokedUrlCommand*)command
{
	[TestFairy resume];
	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
