// NSURL+RRCoreServices.h
//
// Copyright © 2008, 2009, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------

#import <CoreServices/CoreServices.h>

@interface NSURL(RRCoreServices)

- (BOOL)registerComponentFile:(NSInteger)global error:(NSError **)outError;
	// Registers a file component. This instance must be a file URL. Answers YES
	// on success. Successful means self describes a file and Core Services
	// successfully registers the component it describes.
	// Use registerComponentGlobal or 0 for the "global" argument, i.e. 1 or 0.

@end
