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
    var id:String!
    var userId:String!
    var activityName:String!
    var activityLocationName:String!
    var participants:NSNumber!
    var longitude:NSNumber!
    var latitude:NSNumber!
    var dateposted:NSDate!
    var formattedLocation:String!
    static let activityPostPath = "/api/activityposts"
    
    static func initResponseDescriptor() -> RKResponseDescriptor{
         let activityPostMapping = RKObjectMapping(forClass: ActivityPost.self)
         let mappings = [
                "id":"id",
                "activityname":"activityName",
                "activitylocationname":"activityLocationName",
                "locationcoordinates.lng":"longitude",
                "locationcoordinates.lat":"latitude",
                "dateposted":"dateposted",
                "userId":"userId",
                "participants":"participants"
        ]
        activityPostMapping.addAttributeMappingsFromDictionary(mappings)
        let responseDescriptor = RKResponseDescriptor(mapping: activityPostMapping, method:RKRequestMethod.GET, pathPattern: self.activityPostPath, keyPath: nil, statusCodes: NSIndexSet(index: 200))
        return responseDescriptor
    }
    
    static func initRequestDescriptor() -> RKRequestDescriptor{
        let activityPostRequestMapping = RKObjectMapping.requestMapping()
        activityPostRequestMapping.addAttributeMappingsFromArray(["activityName","formattedLocation","dateposted","userId"])
        let requestDescriptor = RKRequestDescriptor(mapping: activityPostRequestMapping, objectClass: ActivityPost.self, rootKeyPath: nil, method: .POST)
        return requestDescriptor
        
    }
    
}
