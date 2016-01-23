# Timer
Cartoon Timer built with Objective C on Xcode 7.

Jan 23 2016 :
- Figured out how to untrack xcuserdata for the XCode project.
- Used NSDate elapsed time instead of a counter that's incremented every hundredth second. Instead now the NSTimer is used to invoke what's the elapsed time (NSDate) every approximately hundredth second. Therefore the Timer is now accurate.

Note : NSTimer refresh rate cannot go down to 0.01 second, therefore using counter in NSTimer can make the timer inaccurate.


Jan 22 2016 : Timer has Start, Reset and Stop button. Display of time is formatted to h:mm:ss. Suspected that NSTimer increment is not accurate.
