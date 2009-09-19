// $Id: NSString+RRCoreServices.h,v 1.1 2008/10/30 18:09:59 royratcliffe Exp $
//
// Copyright © 2008, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------
//
// $Log: NSString+RRCoreServices.h,v $
// Revision 1.1  2008/10/30 18:09:59  royratcliffe
// NSString extensions using Core Services, initial revision
//

#import <CoreServices/CoreServices.h>

@interface NSString(RRCoreServices)

- (BOOL)launchServiceItemIsInvisible:(CFBooleanRef)boolean;
- (BOOL)launchServiceItemIsInvisible;
	// YES if the string represents an invisible launch service item. Answers NO
	// if visible or not a launch service item! Answering NO could also mean
	// that (1) the string fails to convert from a POSIX-style path-name to a
	// File System reference; or (2) Launch Services fail to obtain the
	// invisible item attribute.
- (BOOL)launchServiceItemIsVisible;
	// Same as above only in reverse: YES means that the string is
	// POSIX-to-reference convertable, attribute is obtainable and invisible is
	// false.

@end
