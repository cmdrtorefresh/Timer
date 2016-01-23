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
    
    self.Label.font = [UIFont fontWithName:@"From Cartoon Blocks" size:70];
    
    self.Label.textColor = [UIColor redColor];
    
    countInt = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCount:(id)sender {
    
    if (second%60 < 10){
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:0%i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:0%i", hour, minute%60, second%60];
        }
    } else {
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:%2i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:%2i", hour, minute%60, second%60];
        }
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countTimer) userInfo:nil repeats:YES];
    
}

- (IBAction)resetCount:(id)sender {
    
    countInt = 0;
    second = countInt / 100;
    hundredth = 0;
    minute = second / 60;
    hour = minute / 60;

    [timer invalidate];

    if (second%60 < 10){
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:0%i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:0%i", hour, minute%60, second%60];
        }
    } else {
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:%2i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:%2i", hour, minute%60, second%60];
        }
    }
    
    self.FastCount.text = [NSString stringWithFormat:@"%2i", hundredth];
    
}

- (IBAction)stopCount:(id)sender {
    
    [timer invalidate];
    
}

- (void)countTimer {
    
    countInt += 1;
    second = countInt / 100;
    hundredth = countInt % 100;
    minute = second / 60;
    hour = minute / 60;
    
    if (second%60 < 10){
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:0%i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:0%i", hour, minute%60, second%60];
        }
    } else {
        if (minute%60 < 10){
            self.Label.text = [NSString stringWithFormat:@"%2i:0%i:%2i", hour, minute%60, second%60];
        } else {
            self.Label.text = [NSString stringWithFormat:@"%2i:%2i:%2i", hour, minute%60, second%60];
        }
    }
    
    self.FastCount.text = [NSString stringWithFormat:@"%2i", hundredth];
    
}
@end
