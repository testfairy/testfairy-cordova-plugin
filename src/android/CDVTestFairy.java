package com.testfairy;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;
import android.content.Intent;

import android.content.Context;

public class CDVTestFairy extends CordovaPlugin {
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if ("begin".equals(action)) {
			String apiKey = args.optString(0);
			TestFairy.begin(cordova.getActivity(), apiKey);
		} else if ("pushFeedbackController".equals(action)) {

		} else if ("updateLocation".equals(action)) {

		} else if ("checkpoint".equals(action)) {
			String name = args.optString(0);
			TestFairy.addCheckpoint(name);
		} else if ("setCorrelationId".equals(action)) {
			String id = args.optString(0);
			TestFairy.setCorrelationId(id);
		} else if ("pause".equals(action)) {
			TestFairy.pause();
		} else if ("resume".equals(action)) {
			TestFairy.resume();
		} else {
			return false;
		}

        callbackContext.success();
		return true;
	}
}
