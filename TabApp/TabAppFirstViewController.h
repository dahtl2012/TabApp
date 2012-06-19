//
//  TabAppFirstViewController.h
//  TabApp
//
//  Created by Dominik Arnhof on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface TabAppFirstViewController : UIViewController <CPTPlotDataSource>
{
    CPTXYGraph *graph;
}

@property (weak, nonatomic) IBOutlet CPTGraphHostingView *graphHost;
@end
