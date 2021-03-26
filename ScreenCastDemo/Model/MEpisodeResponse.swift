//
//  MEpisodeResponse.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 26/3/21.
//

import ObjectMapper

struct MEpisodeResponse: Mappable {
    
    var episodeList: [MEpisode]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        episodeList <- map["episodes"]
    }
}
