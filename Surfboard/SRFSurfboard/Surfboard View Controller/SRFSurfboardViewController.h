//
//  MBSurfboardViewController.h
//  Surfboard
//
//  Created by Moshe on 8/10/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRFSurfboardDelegate.h"

@interface SRFSurfboardViewController : UICollectionViewController

#pragma mark - Delegate

/** ---
 *  @name Delegate
 *  ---
 */

@property (nonatomic, assign) id<SRFSurfboardDelegate> delegate;

#pragma mark - Colors

/** ---
 *  @name Color
 *  ---
 */

/**
 *  The tint color of the cells.
 */

@property (nonatomic, strong) UIColor *tintColor;

/**
 *  The background color of the view.
 */

@property (nonatomic, strong) UIColor *backgroundColor;

#pragma mark - Initializers

/**
 *  Instantiates a new surfboard with an array of panel objects.
 *
 *  @param configuration An array of panels.
 *  @return An SRFSurfboardViewController.
 */

- (instancetype)initWithPathToConfiguration:(NSString *)path;

/**
 *  Instantiates a new surfboard with an array of panel objects.
 *
 *  @param panels An array of panels.
 *  @return An SRFSurfboardViewController
 */

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

- (instancetype)initWithPanels:(NSArray *)panels NS_DESIGNATED_INITIALIZER;

#pragma mark - Setting the Panels After Initializing

/** ---
 *  @name Setting the Panels After Initializing
 *  ---
 */

/**
 *  Sets the panels and reloads the surfboard.
 *
 *  @param panels An array of panels.
 */

- (void)setPanels:(NSArray *)panels;

#pragma mark - Load Panels from Configuration

/** ---
 *  @name Load Panels From Configuration
 *  ---
 */

/**
 *  Loads panels out from a given path.
 *
 *  @param path The path from which to load the panel configuration.
 *
 *  @return An array of panels.
 */

+ (NSArray *)panelsFromConfigurationAtPath:(NSString *)path;

@end
