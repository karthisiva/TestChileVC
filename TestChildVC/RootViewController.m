//
//  RootViewController.m
//  TestChildVC
//
//  Created by Hadhi Abdul on 02/03/17.
//  Copyright © 2017 TON. All rights reserved.
//

#import "RootViewController.h"
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "UIView+Layout.h"

@interface RootViewController ()

@property (nonatomic, weak) IBOutlet    UISegmentedControl              *segmentControl;
@property (nonatomic, strong)           FirstTableViewController        *firstVC;
@property (nonatomic, strong)           SecondTableViewController       *secondVC;
@property (nonatomic, weak)             UIViewController                *currentVC;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.segmentControl setSelectedSegmentIndex:0];
    [self setSubViewControllerAtIndex:0];
}

- (IBAction)segmentAction:(UISegmentedControl *)sender {
    [self setSubViewControllerAtIndex:sender.selectedSegmentIndex];
}

- (void)setSubViewControllerAtIndex:(NSInteger)index {
    UIViewController *newVC = nil;
    
    if (index == 0) {
        newVC = self.firstVC;
    } else {
//        CGRect frame = self.secondVC.view.frame;
//        frame.origin.y = 64;
//        self.secondVC.view.frame = frame;
        newVC = self.secondVC;
    }
    
    if (self.currentVC != nil) {
        [self.currentVC willMoveToParentViewController:nil];
        [self.currentVC.view removeFromSuperview];
        [self.currentVC removeFromParentViewController];
        [self.currentVC didMoveToParentViewController:nil];
    }
    
    self.currentVC = newVC;
     [self addChildViewController:self.currentVC];
    self.currentVC.view.frame = self.containerView.bounds;
    self.currentVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.containerView addSubview:self.currentVC.view];
    [self.currentVC didMoveToParentViewController:self];
}

- (FirstTableViewController *)firstVC {
    if (_firstVC == nil) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _firstVC = (FirstTableViewController *)[sb instantiateViewControllerWithIdentifier:NSStringFromClass([FirstTableViewController class])];
    }
    return _firstVC;
}

- (SecondTableViewController *)secondVC {
    if (_secondVC == nil) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _secondVC = (SecondTableViewController *)[sb instantiateViewControllerWithIdentifier:NSStringFromClass([SecondTableViewController class])];
    }
    return _secondVC;
}

@end
