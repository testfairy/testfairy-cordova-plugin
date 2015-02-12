#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TestFairy: NSObject

/**
 * Initialize a TestFairy session.
 *
 * @param APIKey
 */
+ (void)begin:(NSString *)APIKey;

/**
 * Hides a specific view from appearing in the video generated.
 *
 * @param view
 */
+ (void)hideView:(UIView *)view;

/**
 * Pushes the feedback view controller. Hook a button
 * to this method to allow users to provide feedback about the current
 * session. All feedback will appear in your build report page, and in
 * the recorded session page.
 *
 */
+ (void)pushFeedbackController;

/**
 * Proxy didUpdateLocation delegate values and these
 * locations will appear in the recorded sessions. Useful for debugging
 * actual long/lat values against what the user sees on screen.
 *
 * @param locations
 */
+ (void)updateLocation:(NSArray *)locations;

/**
 * Marks a checkpoint in session. Use this text to tag a session
 * with a checkpoint name. Later you can filter sessions where your
 * user passed through this checkpoint, for bettering understanding
 * user experience and behavior.
 *
 * @param name
 */
+ (void)checkpoint:(NSString *)name;

/**
 * Sets a correlation identifier for this session. This value can
 * be looked up via web dashboard. For example, setting correlation
 * to the value of the user-id after they logged in. Can be called
 * only once per session (subsequent calls will be ignored.)
 *
 * @param correlationId
 */
+ (void)setCorrelationId:(NSString *)correlationId;

/**
 * Pauses the current session. This method stops recoding of
 * the current session until resume has been called.
 *
 * @see resume
 */
+ (void)pause;

/**
 * Resumes the recording of the current session. This method
 * resumes a session after it was paused.
 *
 * @see pause
 */
+ (void)resume;

/**
 * Returns the address of the recorded session on testfairy's
 * developer portal. Will return nil if recording not yet started.
 *
 * @return session URL
 */
+ (NSString *)sessionUrl;

@end


