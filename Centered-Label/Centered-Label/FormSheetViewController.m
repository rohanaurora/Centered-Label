//
//  FormSheetViewController.m
//  Centered-Label
//
//  Created by Rohan Aurora on 2/7/15.
//  Copyright (c) 2015 Rohan Aurora. All rights reserved.
//

#import "FormSheetViewController.h"

NSString *const kFirst = @"Rohan's Savings";
NSString *const kSecond = @"$20,99";
NSString *const kSavings = @"$350,000,000.00";

@interface FormSheetViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation FormSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *containingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    containingView.backgroundColor = [UIColor yellowColor];
    containingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:containingView];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    firstLabel.text = kFirst;
    firstLabel.font = [UIFont fontWithName:@"Helvetica" size:22];
    firstLabel.textAlignment = NSTextAlignmentCenter;
    [containingView addSubview:firstLabel];
    [firstLabel sizeToFit];
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    secondLabel.text = kSecond;
    secondLabel.font = [UIFont fontWithName:@"Helvetica" size:28];
    secondLabel.textAlignment = NSTextAlignmentCenter;
    [containingView addSubview:secondLabel];
    [secondLabel sizeToFit];
    secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    thirdLabel.text = @"Rohan's Checking";
    thirdLabel.font = [UIFont fontWithName:@"Helvetica" size:22];
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    [containingView addSubview:thirdLabel];
    [thirdLabel sizeToFit];
    thirdLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    UILabel *fourthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    fourthLabel.text = kSavings;
    fourthLabel.font = [UIFont fontWithName:@"Helvetica" size:28];
    fourthLabel.textAlignment = NSTextAlignmentCenter;
    [containingView addSubview:fourthLabel];
    [fourthLabel sizeToFit];
    fourthLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGSize sizeOfText = [fourthLabel.text sizeWithAttributes:@{NSFontAttributeName:fourthLabel.font}];

    UIView *spacingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20.0f, sizeOfText.height)];
    [containingView addSubview:spacingView];
    spacingView.translatesAutoresizingMaskIntoConstraints = NO;

    
    UIView *spacingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20.0f, sizeOfText.height)];
    [containingView addSubview:spacingView2];
    spacingView2.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSDictionary *metrics = @{@"width":@21.0, @"margin":@30.0};
    UIView *superview = self.view;

    
    NSDictionary *views = NSDictionaryOfVariableBindings(firstLabel, secondLabel, thirdLabel, fourthLabel, superview, spacingView, spacingView2, containingView);
    
    // Centered Spacer1
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[containingView]-(<=1)-[spacingView]"
                                                                   options:NSLayoutFormatAlignAllCenterX
                                                                   metrics:metrics
                                                                     views:views];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[firstLabel]-[spacingView]"
                                                                                                     options:0
                                                                                                     metrics:metrics
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[spacingView]-[secondLabel]-(>=1)-|"
                                                                                                     options:0
                                                                                                     metrics:metrics
                                                                                                       views:views]];
    
    //////////
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[firstLabel]-20-[thirdLabel]"
                                                                                                     options:0
                                                                                                     metrics:0
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-96-[secondLabel]-16-[fourthLabel]"
                                                                                                     options:0
                                                                                                     metrics:0
                                                                                                       views:views]];


    // Third and Fourth
    // Center horizontally
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[containingView]-(<=1)-[spacingView2]"
                                                                                                     options:NSLayoutFormatAlignAllCenterX
                                                                                                     metrics:metrics
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=1)-[thirdLabel]-[spacingView2]"
                                                                                                     options:0
                                                                                                     metrics:metrics
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[spacingView2]-[fourthLabel]-(>=1)-|"
                                                                                                     options:0
                                                                                                     metrics:metrics
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=80)-[containingView]-(<=250)-|"
                                                                                                     options:0
                                                                                                     metrics:0
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=20)-[containingView]-(<=20)-|"
                                                                                                     options:0
                                                                                                     metrics:0
                                                                                                       views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=1)-[containingView]"
                                                                                                     options:NSLayoutFormatAlignAllCenterX
                                                                                                     metrics:metrics
                                                                                                       views:views]];



    

    [self.view addConstraints:constraints];

}

- (IBAction)dismissFormSheet:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
