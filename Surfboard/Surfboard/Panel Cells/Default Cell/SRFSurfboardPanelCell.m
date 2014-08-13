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

/**
 *  The device image.
 */

@property (weak, nonatomic) IBOutlet UIImageView *deviceImage;

@end

@implementation SRFSurfboardPanelCell

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    self = [super awakeAfterUsingCoder:aDecoder];
    
    if (self)
    {   
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)prepareForReuse
{
    
    //  Set the title text.
    self.textView.text = self.panel.text;
    
    //  Add the image, tinted
    self.imageView.image = [self.panel.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    //  Apply the title
    [self.actionButton setTitle:self.panel.buttonTitle forState:UIControlStateNormal];
    
    //  Hide the button on panels with no title.
    self.actionButton.hidden = (self.panel.buttonTitle == nil);
}

- (void)setPanel:(SRFSurfboardPanel *)panel
{
    _panel = panel;
    
    [self prepareForReuse];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    self.actionButton.layer.cornerRadius = 5.0f;
    self.actionButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    self.textView.textColor = self.tintColor;
    
    self.deviceImage.image = [self.deviceImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.actionButton setTitleColor:self.tintColor forState:UIControlStateNormal];
    
    /**
     *  Debug borders
     */
    
//    self.contentView.layer.borderColor = [UIColor redColor].CGColor;
//    self.contentView.layer.borderWidth = 2.0f;
}

@end
