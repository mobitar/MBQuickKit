
#import "UIAlertView+Utils.h"
#import "UIView+Utils.h"
#import "UIScrollView+Utils.h"
#import "UIViewController+Utils.h"
#import "UITableView+Utils.h"
#import "NSDate+Utils.h"
#import "NSString+MBQuickKit.h"
#import "UIControl+Utils.h"
#import "UIView+Animations.h"
#import "NSFileManager+Utils.h"
#import "NSArray+Utils.h"
#import "NSObject+Utils.h"
#import "NSException+Utils.h"
#import "NSLocale+Utils.h"
#import "UIImage+Utils.h"
#import "UINavigationBar+Utils.h"
#import "UIColor+Util.h"
#import "UIImageView+Utils.h"
#import "NSMutableArray+Utils.h"
#import "MFMailComposeViewController+MBQuickKit.h"
#import "NSDictionary+MBQuickKit.h"
#import "UIButton+MBQuickKit.h"
#import "UILabel+MBQuickKit.h"
#import "UISearchBar+MBQuickKit.h"
#import "NSError+MBQuickKit.h"
#import "UIStoryboard+MBQuickKit.h"
#import "UICollectionView+MBQuickKit.h"
#import "MKMapView+MBQuickKit.h"
#import "UITableViewCell+MBQuickKit.h"
#import "UIBarButtonItem+MBQuickKit.h"
#import "NSNumber+MBQuickKit.h"
#import "NSTimeZone+MBQuickKit.h"
#import "UIApplication+MBQuickKit.h"
#import "UIFont+MBQuickKit.h"
#import "CLLocation+MBQuickKit.h"
#import "NSIndexPath+MBQuickKit.h"
#import "UIPageViewController+MBQuickKit.h"
#import "UIWindow+MBQuickKit.h"
#import "NSURL+MBQuickKit.h"
#import "RMUniversalAlert+MBQuickKit.h"

#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"%s Time: %f", __func__, -[startTime timeIntervalSinceNow]);

/** Via http://www.takingnotes.co/blog/2011/09/27/making-nsassert-play-nice-with-blocks/ */
#if !defined(NS_BLOCK_ASSERTIONS)
    #define BlockAssert(condition, desc, ...) \
    do {\
    if (!(condition)) { \
    [[NSAssertionHandler currentHandler] handleFailureInFunction:NSStringFromSelector(_cmd) \
    file:[NSString stringWithUTF8String:__FILE__] \
    lineNumber:__LINE__ \
    description:(desc), ##__VA_ARGS__]; \
    }\
    } while(0);
#else // NS_BLOCK_ASSERTIONS defined
    #define BlockAssert(condition, desc, ...)
#endif