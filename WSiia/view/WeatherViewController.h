//
//  WeatherViewController.h
//  WSiia
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *WeatherID_lbl;
@property (weak, nonatomic) IBOutlet UILabel *WeatherDescription_lbl;
@property (weak, nonatomic) IBOutlet UILabel *WeatherMain_lbl;
@property (strong, nonatomic) Weather *weather;
@end
