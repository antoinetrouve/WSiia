//
//  WeatherWebServiceAdapter.h
//  WSiia
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 iia.antoinetrouve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherWebServiceAdapter : NSObject
+(NSString *) JSON_WEATHER;
+(NSString *) JSON_ID;
+(NSString *) JSON_DESCRIPTION;
+(NSString *) JSON_MAIN;
+(NSString *) JSON_URL;

-(void) getWeather:(void (^)(Weather *)) callback;
-(void) createWeather:(Weather *)weather withCallback:(void(^)(Weather *))callback;
-(void) updateWeather:(Weather *)weather withCallback:(void(^)(Weather *))callback;
-(Weather*) extract:(NSDictionary *) json;
-(NSDictionary *) itemToJson:(Weather *) weather;

@end
