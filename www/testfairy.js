/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
*/

'use strict';

var argscheck = require('cordova/argscheck'),
utils = require('cordova/utils'),
exec = require('cordova/exec');

var TestFairy = function() {
	this.serviceName = "TestFairy";
}

TestFairy.prototype.begin = function(APIKey) {
	if (APIKey) {
		exec(function(){}, function(){}, this.serviceName, "begin", [ APIKey ]);
	} else {
		// api key not provided

		var errorString = "Invalid App Token";
		if (failureCallback) {
			failureCallback(errorString);
		} else {
			console.error(errorString);
		}
	}
};

/**
 * (Optional) Push the feedback view controller. Hook a button
 * to this method to allow users to provide feedback about the current
 * session. All feedback will appear in your build report page, and in
 * the recorded session page.
 *
 */
TestFairy.prototype.pushFeedbackController = function() {
	exec(function(){}, function(){}, this.serviceName, "pushFeedbackController", [ ]);
}

/**
 * (Optional) Proxy didUpdateLocation delegate values and these
 * locations will appear in the recorded sessions. Useful for debugging
 * actual long/lat values against what the user sees on screen.
 *
 * @param locations
 */
TestFairy.prototype.updateLocation = function(locations) {
	exec(function(){}, function(){}, this.serviceName, "updateLocation", locations);
}

/**
 * (Optional) Mark a checkpoint in session. Use this text to tag a
 * session with a checkpoint name. Later you can filter sessions
 * that passed through this checkpoint, for better understanding
 * user experience.
 *
 * @param name
 */
TestFairy.prototype.checkpoint = function(name) {
	exec(function(){}, function(){}, this.serviceName, "checkpoint", [ name ]);
}

/**
 * (Optional) Set a correlation identifier for this session. This
 * value can be looked up via web dashboard. For example, setting
 * correlation id with user id after they logged in. Can be called
 * only once per session.
 *
 * @param correlationId
 * @deprecated use identity instead
 */
TestFairy.prototype.setCorrelationId = function(correlationId) {
	exec(function(){}, function(){}, this.serviceName, "setCorrelationId", [ correlationId ]);
}

/**
 * Sets a correlation identifier for this session. This value can
 * be looked up via web dashboard. For example, setting correlation
 * to the value of the user-id after they logged in. Can be called
 * only once per session (subsequent calls will be ignored.)
 *
 * @param correlationId Id for the current session
 * @param @optional traits Attributes and custom attributes to be associated with this session
 */
TestFairy.prototype.identify = function(correlationId, traits) {
	exec(function(){}, function(){}, this.serviceName, "identify", Array.prototype.slice.call(arguments));
}

/**
 * (Optional) Pause the current session. This method stops all
 * of the recordings untill resume is called.
 *
 */
TestFairy.prototype.pause = function() {
	exec(function(){}, function(){}, this.serviceName, "pause", []);
}

/**
 * (Optional) Resume recordings of the current session. This
 * method resumes the session recordings after it was paused.
 *
 */
TestFairy.prototype.resume = function() {
	exec(function(){}, function(){}, this.serviceName, "resume", []);
}

/**
 * Change the server endpoint for use with on-premise hosting. Please
 * contact support or sales for more information. Must be called before begin
 *
 * @param serverOverride server address for use with TestFairy
 */
TestFairy.prototype.setServerEndpoint = function(url) {
	exec(function(){}, function(){}, this.serviceName, "setServerEndpoint", [ url ]);
}

/**
 * Remote logging, use log as you would use console.log. These logs will be sent to the server.
 */
TestFairy.prototype.log = function(message) {
	exec(function(){}, function(){}, this.serviceName, "log", [ JSON.stringify(message) ]);
}

TestFairy.prototype.hideWebViewElements = function(selector) {
	exec(function(){}, function(){}, this.serviceName, "hideWebViewElements", [ selector ]);
}

/**
 * Send a feedback on behalf of the user. Call when using a in-house
 * feedback view controller with a custom design and feel. Feedback will
 * be associated with the current session.
 *
 * @param feedbackString Feedback text
 */
TestFairy.prototype.sendUserFeedback = function(feedback) {
	exec(function(){}, function(){}, this.serviceName, "sendUserFeedback", [ feedback ]);
}

/**
 * Stops the current session recording. Unlike 'pause', when
 * calling 'resume', a new session will be created and will be
 * linked to the previous recording. Useful if you want short
 * session recordings of specific use-cases of the app. Hidden
 * views and user identity will be applied to the new session
 * as well, if started.
 */
TestFairy.prototype.stop = function() {
	exec(function(){}, function(){}, this.serviceName, "stop", [ ]);
}

/**
 * Set a custom name for the current screen. Useful for applications that don't use more than one
 * Activity. This name is displayed for a given screenshot, and will override the name of the current
 * Activity.
 *
 * @param name String
 */
TestFairy.prototype.setScreenName = function(name) {
	exec(function(){}, function(){}, this.serviceName, "setScreenName", [ name ]);
}

/**
 * Use this function to tell TestFairy who is the user,
 * It will help you to search the specific user in the TestFairy dashboard.
 * We recommend passing values such as email, phone number, or user id that your app may use.
 *
 * @param userId We recommend to use email as userId, But It can be phone number or any other unique id.
 */
TestFairy.prototype.setUserId = function(userId) {
	exec(function(){}, function(){}, this.serviceName, "setUserId", [ userId ]);
}

/**
 * Records an attribute that will be added to the session.
 *
 * NOTE: The SDK limits you to storing 64 attribute keys. Adding more than 64 will fail and return false.
 *
 * @param key The key of the attribute
 * @param value The value associated with the attribute max size of 1kb
 * @return boolean true if successfully set attribute value, otherwise false
 */
TestFairy.prototype.setAttribute = function(key, value) {
	exec(function(){}, function(){}, this.serviceName, "setAttribute", [ key, value ]);
}

/**
 * Enables the ability to capture crashes. TestFairy
 * crash handler is installed by default. Once installed
 * it cannot be uninstalled. Must be called before begin.
 */
TestFairy.prototype.enableCrashHandler = function() {
	exec(function(){}, function(){}, this.serviceName, "enableCrashHandler", [ ]);
}

/**
 * Disables the ability to capture crashes. TestFairy
 * crash handler is installed by default. Once installed
 * it cannot be uninstalled. Must be called before begin.
 */
TestFairy.prototype.disableCrashHandler = function() {
	exec(function(){}, function(){}, this.serviceName, "disableCrashHandler", [ ]);
}

/**
 * Enables recording of a metric regardless of build settings.
 * Valid values include "cpu", "memory", "logcat", "battery", "network-requests"
 * A metric cannot be enabled and disabled at the same time, therefore
 * if a metric is also disabled, the last call to enable to disable wins.
 * Must be called be before begin.
 */
TestFairy.prototype.enableMetric = function(metric) {
	exec(function(){}, function(){}, this.serviceName, "enableMetric", [ metric ]);
}

/**
 * Disables recording of a metric regardless of build settings.
 * Valid values include "cpu", "memory", "logcat", "battery", "network-requests"
 * A metric cannot be enabled and disabled at the same time, therefore
 * if a metric is also disabled, the last call to enable to disable wins.
 * Must be called be before begin.
 */
TestFairy.prototype.disableMetric = function(metric) {
	exec(function(){}, function(){}, this.serviceName, "disableMetric", [ metric ]);
}

/**
 * Enables the ability to capture video recording regardless of build settings.
 * Valid values for policy include "always", "wifi" and "none"
 * Valid values for quality include "high", "low", "medium"
 * Values for fps must be between 0.1 and 2.0. Value will be rounded to
 * the nearest frame.
 */
TestFairy.prototype.enableVideo = function(policy, quality, framesPerSecond) {
	exec(function(){}, function(){}, this.serviceName, "enableVideo", [ policy, quality, framesPerSecond ]);
}

/**
 * Disables the ability to capture video recording. Must be
 * called before begin.
 */
TestFairy.prototype.disableVideo = function() {
	exec(function(){}, function(){}, this.serviceName, "disableVideo", [ ]);
}

/**
 * Enables the ability to present the feedback form
 * based on the method given. Valid values only include
 * "shake". If an unrecognized method is passed,
 * the value defined in the build settings will be
 * used. Must be called before begin.
 */
TestFairy.prototype.enableFeedbackForm = function(method) {
	exec(function(){}, function(){}, this.serviceName, "enableFeedbackForm", [ method ]);
}

/**
 * Disables the ability to present users with feedback when
 * devices is shaken, or if a screenshot is taken. Must be called
 * before begin.
 */
TestFairy.prototype.disableFeedbackForm = function() {
	exec(function(){}, function(){}, this.serviceName, "disableFeedbackForm", [ ]);
}

/**
 * Sets the maximum recording time. Minimum value is 60 seconds,
 * else the value defined in the build settings will be used. The
 * maximum value is the lowest value between this value and the
 * value defined in the build settings.
 * Time is rounded to the nearest minute.
 * Must be called before begin.
 */
TestFairy.prototype.setMaxSessionLength = function(seconds) {
	exec(function(){}, function(){}, this.serviceName, "setMaxSessionLength", [ seconds ]);

}

// var _testfairyConsoleLog = console.log;
// console.log = function(message) {
// 	_testfairyConsoleLog(message);
// 	TestFairy.log(message);
// }

module.exports = new TestFairy();
