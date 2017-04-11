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

TestFairy.prototype.sendUserFeedback = function(feedback) {
	exec(function(){}, function(){}, this.serviceName, "sendUserFeedback", [ feedback ]);
}

TestFairy.prototype.stop = function() {
	exec(function(){}, function(){}, this.serviceName, "stop", [ ]);
}

TestFairy.prototype.setScreenName = function(name) {
	exec(function(){}, function(){}, this.serviceName, "setScreenName", [ name ]);
}

TestFairy.prototype.setUserId = function(userId) {
	exec(function(){}, function(){}, this.serviceName, "setUserId", [ userId ]);
}

TestFairy.prototype.setAttribute = function(key, value) {
	exec(function(){}, function(){}, this.serviceName, "setAttribute", [ key, value ]);
}

// var _testfairyConsoleLog = console.log;
// console.log = function(message) {
// 	_testfairyConsoleLog(message);
// 	TestFairy.log(message);
// }

module.exports = new TestFairy();

