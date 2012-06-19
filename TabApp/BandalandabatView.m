//
//  BandalandabatView.m
//  TabApp
//
//  Created by Dominik Arnhof on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BandalandabatView.h"

@implementation BandalandabatView
@synthesize BandaLabel;
@synthesize BandaCounter;
@synthesize BandaTab;
@synthesize s = _s;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.BandaCounter = 1;
    
    if (self.BandaCounter == 1) {
        self.s = @"s";
    }
    else {
        self.s = @"";
    }
    NSString *BandaText = [NSString stringWithFormat:@"Sie haben %d neue%@ Bandalandabat!", self.BandaCounter, self.s];
    self.BandaTab.badgeValue = [NSString stringWithFormat:@"%d", self.BandaCounter];
    
    self.BandaLabel.text = BandaText;
}


- (void)viewDidUnload
{
    [self setBandaLabel:nil];
    [self setBandaTab:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)FuckButton:(id)sender {
    //NSString *s;
    //NSString *BandaCounter = @"1";
    
    self.BandaCounter = self.BandaCounter + 1;
    if (self.BandaCounter == 1) {
        self.s = @"s";
    }
    else {
        self.s = @"";
    }
    NSString *BandaText = [NSString stringWithFormat:@"Sie haben %d neue%@ Bandalandabat!", self.BandaCounter, self.s];
    self.BandaTab.badgeValue = [NSString stringWithFormat:@"%d", self.BandaCounter];
    self.BandaLabel.text = BandaText;
}
@end
