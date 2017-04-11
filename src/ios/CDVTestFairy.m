#import "CDVTestFairy.h"
#import "TestFairy.h"
#import <CoreLocation/CoreLocation.h>
#import <Cordova/CDVPluginResult.h>

@implementation CDVTestFairy

- (void)begin:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^{
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
	}];
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

- (void)log:(CDVInvokedUrlCommand*)command {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *message = [arguments objectAtIndex:0];
		TFLog(@"%@", message);
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"message is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setServerEndpoint:(CDVInvokedUrlCommand*)command {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *url = [arguments objectAtIndex:0];
		[TestFairy setServerEndpoint:url];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"url is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hideWebViewElements:(CDVInvokedUrlCommand*)command {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *cssSelector = [arguments objectAtIndex:0];
		[TestFairy hideWebViewElements:cssSelector];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"selector is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sendUserFeedback:(CDVInvokedUrlCommand *)command {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *feedback = [arguments objectAtIndex:0];
		[TestFairy sendUserFeedback:feedback];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feedback is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stop:(CDVInvokedUrlCommand *)command  {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

	[TestFairy stop];
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setScreenName:(CDVInvokedUrlCommand *)command  {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *name = [arguments objectAtIndex:0];
		[TestFairy setScreenName:name];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"screen name is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserId:(CDVInvokedUrlCommand *)command  {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 0) {
		NSString *userId = [arguments objectAtIndex:0];
		[TestFairy setUserId:userId];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"userId is missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAttribute:(CDVInvokedUrlCommand *)command  {
	NSArray* arguments = command.arguments;
	CDVPluginResult* pluginResult = nil;
	
	if ([arguments count] > 1) {
		NSString *key = [arguments objectAtIndex:0];
		NSString *value = [arguments objectAtIndex:1];
		[TestFairy setAttribute:key withValue:value];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"key and value are missing"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
