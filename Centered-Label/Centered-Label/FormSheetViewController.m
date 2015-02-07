//
//  FormSheetViewController.m
//  Centered-Label
//
//  Created by Rohan Aurora on 2/7/15.
//  Copyright (c) 2015 Rohan Aurora. All rights reserved.
//

#import "FormSheetViewController.h"
#define padding_y 200
#define kHeight 200


NSString *const kFirst = @"Rohan's Savings";
NSString *const kSecond = @"$19,00,003,928,838.60";

@interface FormSheetViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation FormSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    firstLabel.text = kFirst;
    firstLabel.font = [UIFont fontWithName:@"Helvetica" size:22];
    firstLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:firstLabel];
    [firstLabel sizeToFit];
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    secondLabel.text = kSecond;
    secondLabel.font = [UIFont fontWithName:@"Helvetica" size:28];
    secondLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:secondLabel];
    [secondLabel sizeToFit];
    secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    thirdLabel.text = @"Total Savings";
    thirdLabel.font = [UIFont fontWithName:@"Helvetica" size:22];
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:thirdLabel];
    [thirdLabel sizeToFit];
    thirdLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view removeConstraints:self.view.constraints];
    
    NSDictionary *metrics = @{@"width":@21.0, @"margin":@30};
    
    NSDictionary *views = NSDictionaryOfVariableBindings(firstLabel, secondLabel, thirdLabel);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[firstLabel]-(width)-[secondLabel]-margin-|"
                                                                   options:0
                                                                   metrics:metrics
                                                                     views:views];

    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[secondLabel]-10-[thirdLabel]|"
                                                                                                     options:NSLayoutFormatAlignAllLeft
                                                                                                     metrics:0
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[firstLabel]|"
                                                                                                     options:0
                                                                                                     metrics:0
                                                                                                       views:views]];
    
    [self.view addConstraints:constraints];

}

- (IBAction)dismissFormSheet:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
