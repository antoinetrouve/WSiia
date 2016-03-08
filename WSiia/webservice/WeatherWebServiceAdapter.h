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

-(void) getWeather:(void (^)(Weather *)) callback;

@end
