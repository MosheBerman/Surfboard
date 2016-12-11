//
//  SRFSurfboardPanel.m
//  Surfboard
//
//  Created by Moshe on 8/12/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "SRFSurfboardPanel.h"

@implementation SRFSurfboardPanel

// MARK: - Initializers

/**
 *  Creates a panel with the configuration.
 *
 *  @param configuration A dictionary with configuration options.
 *  @return A pane.
 */

- (instancetype)initWithConfiguration:(NSDictionary *)configuration
{
    self = [super init];

    if (self)
    {
        _text = configuration[@"text"];
        _image = [[UIImage imageNamed:configuration[@"image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        BOOL isScreenshot = [configuration.allKeys containsObject:@"screen"];
        
        if (isScreenshot)
        {
            _image = [UIImage imageNamed:configuration[@"screen"]];
        }
        
        if ([configuration.allKeys containsObject:@"show-device"])
        {
            _showsDevice = [configuration[@"show-device"] boolValue];
        }
        else
        {
            _showsDevice = isScreenshot;
        }
        
        _buttonTitle = configuration[@"button"];
    }
    
    return self;
}

@end
