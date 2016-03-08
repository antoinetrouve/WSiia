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

//CONSTANTE (voir attribut flux json
+(NSString *) JSON_WEATHER { return @"weather";}
+(NSString *) JSON_ID { return @"id";}
+(NSString *) JSON_DESCRIPTION { return @"description";}
+(NSString *) JSON_MAIN { return @"main";}
+(NSString *) JSON_URL { return @"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98";}

-(void) getWeather:(void (^)(Weather *)) callback {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* URL = WeatherWebServiceAdapter.JSON_URL;
    
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
        weather = [Weather new];
        //tableau de json
        NSArray *weathers = [json objectForKey:WeatherWebServiceAdapter.JSON_WEATHER];
        
        //le json est en format NSDictionary
        // index 0 car un seul tableau dans le flux json sinon faire une boucle foreach
        NSDictionary* weatherDic = [weathers objectAtIndex:0];
        
        weather.idServer = [[weatherDic objectForKey:WeatherWebServiceAdapter.JSON_ID] intValue];
        weather.description = [weatherDic objectForKey:WeatherWebServiceAdapter.JSON_DESCRIPTION];
        weather.main = [weatherDic objectForKey:WeatherWebServiceAdapter.JSON_MAIN];
    }
    return weather;
}

-(void) createWeather:(Weather *)weather withCallback:(void(^)(Weather *))callback{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* URL = WeatherWebServiceAdapter.JSON_URL;
    //parameters = flux json / pogress = method qui sera lancé pendant le traitement
    [manager POST:URL parameters:[self itemToJson:weather] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Weather* weather = [self extract:responseObject];
        callback(weather);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@", error);
        callback(nil);
    }];
    
}

-(NSDictionary *) itemToJson:(Weather *) weather{
    NSDictionary* result = nil;
    if (weather != nil) {
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  weather.description, WeatherWebServiceAdapter.JSON_DESCRIPTION,
                  weather.main, WeatherWebServiceAdapter.JSON_MAIN, nil];
    }
    
    return result;
}
@end
