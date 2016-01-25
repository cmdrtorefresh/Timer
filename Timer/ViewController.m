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
    
    self.Label.font = [UIFont fontWithName:@"From Cartoon Blocks" size:63];
    
    self.Label.textColor = [UIColor redColor];
    
    self.Label.text = @"0:00:00";
    
    accumTime = 0;
    
    reset = false;
    
    running = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCount:(UIButton *)sender {
    if (running == true) {
        [self stopTimer];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    } else if (running == false && reset == true){
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        reset = false;
    } else {
        [self startTimer];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
    }
}


- (IBAction)resetCount:(UIButton *)sender {
    [timer invalidate];
    elapsedTime = 0;
    accumTime = 0;
    
    [self renderLabel];
    reset = true;
    running = false;
    [self startCount:self.startButton];
    
}


- (void)stopTimer {
    [timer invalidate];
    [self renderRunningTime];
    accumTime += elapsedTime;
    running = false;
}


- (void)startTimer {
    reset = false;
    startTime = [NSDate timeIntervalSinceReferenceDate];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(renderRunningTime) userInfo:NULL repeats:YES];
    running =  true;
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
