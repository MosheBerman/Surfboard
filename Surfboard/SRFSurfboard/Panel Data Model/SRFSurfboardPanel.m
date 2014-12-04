//
//  SRFSurfboardPanel.m
//  Surfboard
//
//  Created by Moshe on 8/12/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "SRFSurfboardPanel.h"

@implementation SRFSurfboardPanel

#pragma mark - Initializers

/** ---
 *  @name Initializers
 *  ---
 */

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
        _type = configuration[@"type"] ? [[configuration objectForKey:@"type"] integerValue] : 0;
        
        switch (_type) {
            case SRFSurfboardPanelDefault: {
                _text = configuration[@"text"];
                
                _image = [[UIImage imageNamed:configuration[@"image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                
                if ([configuration.allKeys containsObject:@"screen"])
                {
                    _image = [UIImage imageNamed:configuration[@"screen"]];
                }
                
                _buttonTitle = configuration[@"button"];
            }
                break;
            case SRFSurfboardPanelSubtitle: {
                _text = configuration[@"text"];
                
                _subtitle = configuration[@"subtitle"];
                
                _buttonTitle = configuration[@"button"];
            }
                
            default:
                break;
        }
    }
    
    return self;
}

@end
