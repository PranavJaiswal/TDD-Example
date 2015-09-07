//
//  ViewController.m
//  ParanthesisCount
//
//  Created by Pranav Jaiswal on 7/30/15.
//  Copyright (c) 2015 Pranav Jaiswal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validateInputString:(UIButton *)sender {
    
    NSLog(@"Input String is: %@",self.inputtextField.text);
    NSArray *result = [self checkForValidParanthesisInString:[NSString stringWithString:self.inputtextField.text]];
    self.resultLabel.text = [result objectAtIndex:0];
}

-(NSArray *)checkForValidParanthesisInString:(NSString *)inputString
{
    const char *stringArray = [inputString UTF8String];
    int openBracketCount = 0;
    int closeBracketCount = 0;
    int validBracketsCount =0;
    for (int i=0; i<inputString.length; i++)
    {
        NSLog(@"Character at index %d is:%c",i,stringArray[i]);
        if (stringArray[i] == '(') {
            if (openBracketCount == 0) closeBracketCount = 0;
            openBracketCount++;
        }
        else if (stringArray[i] == ')')
        {
            if (openBracketCount>0)
            {
                closeBracketCount++;
                if (closeBracketCount<=openBracketCount)
                {
                    validBracketsCount++;
                }
                else
                {
                    openBracketCount = 0;
                }
            }
        }
    }
    return [NSArray arrayWithObject:[NSString stringWithFormat:@"Number of valid paranthesis:%d",validBracketsCount]];
}

@end
