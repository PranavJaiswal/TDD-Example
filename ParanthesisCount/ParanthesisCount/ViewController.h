//
//  ViewController.h
//  ParanthesisCount
//
//  Created by Pranav Jaiswal on 7/30/15.
//  Copyright (c) 2015 Pranav Jaiswal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputtextField;
@property (weak, nonatomic) IBOutlet UIButton *validateButton;
- (IBAction)validateInputString:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

