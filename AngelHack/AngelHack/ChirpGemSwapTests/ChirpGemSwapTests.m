/*------------------------------------------------------------------------------
 *
 *  GemSwapTests.m
 *
 *  This file is part of the Chirp SDK for iOS.
 *  For full information on usage and licensing, see http://chirp.io/
 *
 *  Copyright © 2011-2017, Asio Ltd.
 *  All rights reserved.
 *
 *----------------------------------------------------------------------------*/

#import <XCTest/XCTest.h>
#import <ChirpSDK/ChirpSDK.h>


@interface Gem_SwapTests : XCTestCase

@end

@implementation Gem_SwapTests

- (void)testVersion
{
    XCTAssertNotNil([[ChirpSDK sdk] version]);
}

@end
