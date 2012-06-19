//
//  TabAppFirstViewController.m
//  TabApp
//
//  Created by Dominik Arnhof on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TabAppFirstViewController.h"

@implementation TabAppFirstViewController
@synthesize graphHost;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Graph
    graph = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
	CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme];
	[graph applyTheme:theme];
	graph.frame						  = self.view.bounds;
	graph.paddingRight				  = 10.0f;
	graph.paddingLeft				  = 40.0f;
	graph.plotAreaFrame.masksToBorder = NO;
	graph.plotAreaFrame.cornerRadius  = 0.0f;
	CPTMutableLineStyle *borderLineStyle = [CPTMutableLineStyle lineStyle];
	borderLineStyle.lineColor			= [CPTColor whiteColor];
	borderLineStyle.lineWidth			= 2.0f;
	graph.plotAreaFrame.borderLineStyle = borderLineStyle;
	self.graphHost.hostedGraph			= graph;    
    
    //Achsen
    CPTXYAxisSet *xyAxisSet		   = (id)graph.axisSet;
	CPTXYAxis *xAxis			   = xyAxisSet.xAxis;
	CPTMutableLineStyle *lineStyle = [xAxis.axisLineStyle mutableCopy];
	lineStyle.lineCap	= kCGLineCapButt;
	xAxis.axisLineStyle = lineStyle;
	xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    
	CPTXYAxis *yAxis = xyAxisSet.yAxis;
    yAxis.axisConstraints = nil;
	yAxis.axisLineStyle = nil;
  
    // Line plot with gradient fill
	CPTScatterPlot *dataSourceLinePlot = [[CPTScatterPlot alloc] initWithFrame:graph.bounds];
	dataSourceLinePlot.identifier	 = @"Data Source Plot";
	//dataSourceLinePlot.dataLineStyle = nil;
	dataSourceLinePlot.dataSource	 = self;
	[graph addPlot:dataSourceLinePlot];
    
	CPTColor *areaColor		  = [CPTColor colorWithComponentRed:0.0 green:1.0 blue:0.0 alpha:0.8];
	
	dataSourceLinePlot.areaBaseValue = CPTDecimalFromDouble(200.0);
    
    
}

- (void)viewDidUnload
{
    [self setGraphHost:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 51;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot 
                     field:(NSUInteger)fieldEnum 
               recordIndex:(NSUInteger)index 
{
    double wert = (index/5.0)-5;
    
    if(fieldEnum == CPTScatterPlotFieldX)
    { return [NSNumber numberWithDouble:wert]; }
    else
    { 
        if(plot.identifier == @"Data Source Plot")
        { return [NSNumber numberWithDouble:wert*wert]; }
        else if(plot.identifier == @"Data Source Plot2")
        { return [NSNumber numberWithDouble:1/wert]; }
        else {
            return [NSNumber numberWithDouble:1/wert*wert];
        }
        
    }
}

@end
