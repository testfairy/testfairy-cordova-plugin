#import "CDVTestFairy.h"
#import "TestFairy.h"
#import <CoreLocation/CoreLocation.h>
#import <Cordova/CDVPluginResult.h>

@implementation CDVTestFairy

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

- (void)identify:(CDVInvokedUrlCommand*)command {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] <= 0) {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Correlation ID cannot be empty"];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}
	
	NSString *correlationId = [arguments objectAtIndex:0];
	NSDictionary *traitValues = [command argumentAtIndex:1 withDefault:@{}];
	if ([traitValues count] == 0) {
		[TestFairy identify:correlationId];
	} else {
//		NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
//		NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
//		[_dateFormatter setLocale:enUSPOSIXLocale];
//		[_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'.'SSS'Z'"];
//		
//		NSMutableDictionary *traits = [NSMutableDictionary dictionaryWithCapacity:[traitValues count]];
//		for (NSString* key in traitValues) {
//			id value = [traitValues objectForKey:key];
//			NSDate *date = [_dateFormatter dateFromString:value];
//			[traits setObject:(date == nil ? value : date) forKey:key];
//		}
		[TestFairy identify:correlationId traits:traitValues];
	}
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
