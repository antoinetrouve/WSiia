//
//  WeatherWebServiceAdapter.m
//  WSiia
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import "WeatherWebServiceAdapter.h"
#import "AFNetworking.h"

@implementation WeatherWebServiceAdapter

-(void) getWeather:(void (^)(Weather *)) callback {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* URL = @"https://www.raywenderlich.com/demos/weather_sample/weather.php?format=json";
    
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Weather* weather = [self extract:responseObject];
        callback(weather);
        NSLog(@"JSON : %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@", error);
        callback(nil);
    }];

}

-(Weather*) extract:(NSDictionary *) json {
    Weather* weather = nil;
    if (json != nil) {
        NSDictionary *weathers = [json objectForKey:@"weather"];
        weather.idServer = [[weathers objectForKey:@"id"] intValue];
        weather.description = [weathers objectForKey:@"description"];
        weather.main = [weathers objectForKey:@"main"];
    }
    return weather;
}

@end
