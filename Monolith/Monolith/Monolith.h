//
//  Monolith.h
//  Monolith
//
//  Created by Hoon H. on 9/12/14.
//
//

#import <Foundation/Foundation.h>
#import <FoundationExtras/FoundationExtras.h>

#ifdef __APPLE__
#	import <TargetConditionals.h>
#	ifndef TARGET_OS_MAC
#		error	"Apple platform without MAC symbol."
#	endif
#	if		TARGET_OS_MAC
#		if		TARGET_OS_IPHONE
#			import	<UIKit/UIKit.h>
#			import	<UIKitSanitizer/UIKitSanitizer.h>
#		else
#			import	<AppKit/AppKit.h>
#			import	<AppKitSanitizer/AppKitSanitizer.h>
#		endif
#	endif
#endif

#import <EonilSQLite3ForObjectiveC/EonilSQLite3.h>
#import <EonilXML/EonilXML.h>
#import <EonilCommonMark/EonilCommonMark.h>