//
//  ViewController.m
//  Timer
//
//  Created by Stephanie Kirtiadi on 1/21/16.
//  Copyright © 2016 Dahlia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.CartoonTitle.font = [UIFont fontWithName:@"From Cartoon Blocks" size:100];
    
    self.TimerTitle.font = [UIFont fontWithName:@"From Cartoon Blocks" size:100];
    
    self.Label.font = [UIFont fontWithName:@"From Cartoon Blocks" size:63];
    
    self.Label.textColor = [UIColor redColor];
    
    self.Label.text = @"0:00:00.0";
    
    accumTime = 0;
    
    reset = true;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCount:(id)sender {
    
    reset = false;
    
    startTime = [NSDate timeIntervalSinceReferenceDate];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(renderRunningTime) userInfo:NULL repeats:YES];
    
}

- (IBAction)resetCount:(id)sender {
    
    [timer invalidate];
    elapsedTime = 0;
    accumTime = 0;
    
    [self renderLabel];
    reset = true;
    
}

- (IBAction)stopCount:(id)sender {
    if (reset == false){
        [timer invalidate];
        [self renderRunningTime];
        accumTime += elapsedTime;
        
    } else {
        [self renderLabel];
    }
}


- (void)renderRunningTime {
    [self calculateTime];
    [self renderLabel];
}

- (void)calculateTime {
    currentTime = [NSDate timeIntervalSinceReferenceDate];
    elapsedTime = currentTime - startTime;
}


- (void)renderLabel {
    
    second = accumTime + elapsedTime;
    minute = second / 60;
    hour = minute / 60;
    
    
    self.Label.text = [NSString stringWithFormat: @"%i:%02i:%02i", hour, minute % 60, second % 60];
    self.FastCount.text = [NSString stringWithFormat:@"%.0f", 100*((accumTime + elapsedTime) - second)];
    
}


@end
