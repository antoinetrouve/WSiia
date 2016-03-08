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
    NSString* URL = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98";
    
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Weather* weather = [self extract:responseObject];
        callback(weather);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@", error);
        callback(nil);
    }];

}

-(Weather*) extract:(NSDictionary *) json {
    Weather* weather = nil;
    if (json != nil) {
        //tableau de json
        NSArray *weathers = [json objectForKey:@"weather"];
        
        //le json est en format NSDictionary
        // index 0 car un seul tableau dans le flux json sinon faire une boucle foreach
        NSDictionary* weatherDic = [weathers objectAtIndex:0];
        
        weather.idServer = [[weatherDic objectForKey:@"id"] intValue];
        weather.description = [weatherDic objectForKey:@"description"];
        weather.main = [weatherDic objectForKey:@"main"];
    }
    return weather;
}

@end
