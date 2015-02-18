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
 */
TestFairy.prototype.setCorrelationId = function(correlationId) {
	exec(function(){}, function(){}, this.serviceName, "setCorrelationId", [ correlationId ]);
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

module.exports = new TestFairy();

