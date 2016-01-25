//
//  ViewController.h
//  Timer
//
//  Created by Stephanie Kirtiadi on 1/21/16.
//  Copyright © 2016 Dahlia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

    BOOL reset, running;
    int hundredth, second, minute, hour;
    NSTimeInterval startTime, currentTime, elapsedTime,
        accumTime;
    NSTimer *timer;
    
}
@property (weak, nonatomic) IBOutlet UILabel *CartoonTitle;

@property (weak, nonatomic) IBOutlet UILabel *FastCount;

@property (weak, nonatomic) IBOutlet UILabel *Label;
- (IBAction)resetCount:(id)sender;


- (IBAction)startCount:(id)sender;

@end

