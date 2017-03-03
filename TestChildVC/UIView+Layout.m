//
//  UIView+Layout.m
//
//  Created by Hadhi on 11/12/11.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (void)addSubviewAndFill:(UIView *)subView {
    [self addSubview:subView];
    
    NSDictionary *viewBindingsDict = @{@"subView" : subView};
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[subView]|"
                               options:0
                               metrics:nil
                               views:viewBindingsDict]];
    [self addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[subView]|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewBindingsDict]];
}

@end
