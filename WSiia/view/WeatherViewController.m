//
//  WeatherViewController.m
//  WSiia
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "WeatherViewController.h"
#import "Weather.h"
#import "WeatherWebServiceAdapter.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    void (^callback)(Weather*) = ^(Weather* weather){
        self.WeatherID_lbl.text = [NSString stringWithFormat:@"%d",weather.idServer ];
        self.WeatherMain_lbl.text = weather.main;
        self.WeatherDescription_lbl.text = weather.description;
    };
    
    WeatherWebServiceAdapter* wsAdapter = [WeatherWebServiceAdapter new];
    [wsAdapter getWeather:callback];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
