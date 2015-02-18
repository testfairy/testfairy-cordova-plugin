# TestFairy Plugin for Cordova 

[![Build Status](https://travis-ci.org/testfairy/testfairy-cordova-plugin.svg?branch=master)](https://travis-ci.org/testfairy/testfairy-cordova-plugin)

### Supported Platforms

TestFairy SDK for PhoneGap/Cordova is currently available only for *iOS*. For Android apps, just upload the APK files directly to https://app.testfairy.com.

### Installation

To add the plugin to your project, simply run the following command from Terminal:

```
cordova plugin add https://github.com/testfairy/testfairy-cordova-plugin
```

### Usage

Initialize TestFairy with your [App Token](https://app.testfairy.com/settings/#apptoken) by calling `TestFairy.begin` from *onDeviceReady*. For example, here's *onDeviceReady* from *index.js*:

```
onDeviceReady: function() {
  app.receivedEvent('deviceready');
  TestFairy.begin("MY_APP_TOKEN");
},
```

### Methods

 * `TestFairy.begin(app_token)` - Initialize TestFairy SDK with an app token
 * `TestFairy.pause()` - Pause recording 
 * `TestFairy.resume()` - Resume recording
 * `TestFairy.checkpoint(name)` - Mark a checkpoint in session
 * `TestFairy.setCorrelationId(id)` - Set an identifier that can be looked up through dashboard
 * `TestFairy.pushFeedbackController()` - Present a feedback dialog to the user
 * `TestFairy.updateLocation(position)` - Mark geo location at this point (to be used with `navigator.geolocation.getCurrentPosition`)




 

