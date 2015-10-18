//
//  ActivityPost.swift
//  FitFriends
//
//  Created by Dennis Adjei-Baah on 8/8/15.
//  Copyright (c) 2015 Dennis Adjei-Baah. All rights reserved.
//

import Foundation
import RestKit

class ActivityPost:NSObject{
    var id:NSNumber!
    var activityName:String!
    var location:NSDictionary!
    var dateposted:NSDate!
    
    static func initResponseDescriptor() -> RKResponseDescriptor{
         let activityPostMapping = RKObjectMapping(forClass: ActivityPost.self)
         let mappings = ["id":"id","activityname":"activityName","location":"location", "dateposted":"dateposted"]
        activityPostMapping.addAttributeMappingsFromDictionary(mappings)
        let responseDescriptor = RKResponseDescriptor(mapping: activityPostMapping, method:RKRequestMethod.GET, pathPattern: "/api/Activityposts", keyPath: nil, statusCodes: NSIndexSet(index: 200))
        return responseDescriptor
    }
    
    static func initRequestDescriptor -> RKRequestDescriptor{
        
    }
    
}
