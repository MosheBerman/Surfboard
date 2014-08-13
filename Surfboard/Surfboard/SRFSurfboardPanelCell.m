//
//  SRFSurfboardPanel.m
//  Surfboard
//
//  Created by Moshe on 8/12/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "SRFSurfboardPanelCell.h"

/**
 *  A class extension for SRFSurfboardPanelCell
 */

@interface SRFSurfboardPanelCell ()

@end

@implementation SRFSurfboardPanelCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setPanel:(SRFSurfboardPanel *)panel
{
    _panel = panel;
    
    UIFont *font = self.textView.font;
    self.textView.text = self.panel.text;
    self.textView.textColor = [UIColor whiteColor];
    self.textView.font = font;
    
    self.imageView.image = self.panel.image;
    
    [self.actionButton setTitle:self.panel.buttonTitle forState:UIControlStateNormal];
    
    //  Hide the button on panels with no title.
    self.actionButton.hidden = (self.panel.buttonTitle == nil);
}

@end
