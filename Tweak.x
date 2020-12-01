#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

%hook NCNotificationListSectionRevealHintView
- (void)layoutSubviews { 
}
%end

@interface CSFixedFooterView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook CSFixedFooterView
-(void)layoutSubviews {
    self.hidden = TRUE;
}
%end

@interface SBFLockScreenDateView : UIView
@property (nonatomic, assign, readwrite) CGPoint center;
@property (nonatomic, assign, readwrite) BOOL useCompactDateFormat;
@property (nonatomic, strong, readwrite) NSDate *date;
@end

%hook SBFLockScreenDateView
-(void)layoutSubviews {
    CGPoint right = CGPointMake(187.5, 62);
    self.center = right;
	self.useCompactDateFormat = YES;
	NSArray *subviews = [self subviews];
	UILabel *labelA = [subviews objectAtIndex:1];
	NSArray *subviewsA = [labelA subviews];
	UILabel *labelB = [subviewsA objectAtIndex:0];
	NSArray *subviewsB = [labelB subviews];
	UILabel *date = [subviewsB objectAtIndex:0];
	date.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
	// UILabel *timeA = [subviews objectAtIndex:0];
	// NSArray *timeviews = [timeA subviews];
	// UILabel *time = [timeviews objectAtIndex:0];
	// time.font = [UIFont systemFontOfSize:80 weight:UIFontWeightBold];

	// for (int i = 0; i < [timeviews count]; i++) {
	// 	UIView *currentSubView = [timeviews objectAtIndex:i];
	// 	NSMutableString *currentViewDescription = [[NSMutableString alloc] init];
	// 	for (int j = 0; j <= 0; j++) {
	// 		[currentViewDescription appendString:@"   "];
	// 	}
	// 	//[currentViewDescription appendFormat:@"[%d]: class: '%@'", i, NSStringFromClass([currentSubView class])];
	// 	[currentViewDescription appendFormat:@"[%d]: class: '%@'", i, currentSubView];
	// 	NSLog(@"CHR1S: %@", currentViewDescription);
	// }
    %orig;
}
+(UIFont *)timeFont {
	return [UIFont systemFontOfSize:80 weight:UIFontWeightBold];
}
-(void)setAlignmentPercent:(double)arg1 {
    %orig(1);
}
%end

// %hook SBFLockScreenDateSubtitleView
// +(UIFont *)dateTimeLunarDateFont {
// 	return [UIFont systemFontOfSize:35 weight:UIFontWeightBold];
// }
// %end

@interface UIStatusBarWindow
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook UIStatusBarWindow
-(void)layoutSubviews {
    self.hidden = YES;
}
%end