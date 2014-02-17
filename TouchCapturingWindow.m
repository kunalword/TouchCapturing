//
//  TouchCapturingWindow.m
/*
 * Copyright (c) 2013 Kunal Gaikwad.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "TouchCapturingWindow.h"

@implementation TouchCapturingWindow
@synthesize touchesBeganCallback;
@synthesize isUpScrolling;
@synthesize isDownScrolling;
@synthesize delegate;
-(id) init{
    if (self = [super init])
    {
        self.cancelsTouchesInView = NO;
    }
    return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    if (touchesBeganCallback)
        touchesBeganCallback(touches, event);
    
    UITouch *touch=[touches anyObject];
    touchStartPoint=[touch locationInView:self.view].y;
    touchOffsetPoint = 0;
    tempTouchOffsetPoint = 0;
    
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
    
    UITouch *touch=[touches anyObject];
    touchOffsetPoint = [touch locationInView:self.view].y - touchStartPoint;
    if (touchOffsetPoint > tempTouchOffsetPoint) {
    }else{
    }
    tempTouchOffsetPoint = touchOffsetPoint;
    //    NSLog(@"Touches moved");
}
- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if (appDelegate.isWebViewRelease == TRUE) {
        [[self delegate] swipeUpAction];
    }
}
- (void) touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
    
}

- (void)reset
{
    
}

- (void)ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event
{
    
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer
{
    return NO;
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer
{
    return NO;
}

@end