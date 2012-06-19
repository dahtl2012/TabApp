//
//  BandalandabatView.h
//  TabApp
//
//  Created by Dominik Arnhof on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BandalandabatView : UIViewController
- (IBAction)FuckButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *BandaLabel;
@property (copy, nonatomic) NSString *s;
@property (nonatomic) int BandaCounter;
@property (weak, nonatomic) IBOutlet UITabBarItem *BandaTab;


@end
