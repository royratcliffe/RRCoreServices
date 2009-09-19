// $Id: NSURL+RRCoreServices.h,v 1.2 2008/10/30 18:10:32 royratcliffe Exp $
//
// Copyright © 2008, Roy Ratcliffe, Lancaster, United Kingdom
// All rights reserved
//
//------------------------------------------------------------------------------
//
// $Log: NSURL+RRCoreServices.h,v $
// Revision 1.2  2008/10/30 18:10:32  royratcliffe
// Wrapped long comment lines
//
// Revision 1.1  2008/07/11 14:52:29  royratcliffe
// URL extensions for Core Services, initial revision
//

#import <CoreServices/CoreServices.h>

@interface NSURL(RRCoreServices)

- (BOOL)registerComponentFile:(NSInteger)global error:(NSError **)outError;
	// Registers a file component. This instance must be a file URL. Answers YES
	// on success. Successful means self describes a file and Core Services
	// successfully registers the component it describes.
	// Use registerComponentGlobal or 0 for the "global" argument, i.e. 1 or 0.

@end
