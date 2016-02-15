//
//  SRFSurfboardSubtitlePanelCell.m
//  Surfboard
//
//  Created by Sidhant Gandhi on 12/3/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "SRFSurfboardSubtitlePanelCell.h"

@implementation SRFSurfboardSubtitlePanelCell

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
    
    //  Set the subtitle text
    self.subTitle.text = self.panel.subtitle;
    
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
    
    self.subTitle.textColor = self.tintColor;
    
    [self.actionButton setTitleColor:self.tintColor forState:UIControlStateNormal];
    
    /**
     *  Debug borders
     */
    
    //    self.contentView.layer.borderColor = [UIColor redColor].CGColor;
    //    self.contentView.layer.borderWidth = 2.0f;
}


@end
