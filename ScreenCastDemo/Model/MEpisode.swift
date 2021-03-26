//
//  MEpisode.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 24/3/21.
//

import ObjectMapper

struct MEpisode: Mappable {
    
    var title = ""
    var detail = ""
    var smallArtworkURL = ""
    var largeArtworkURL = ""
    var videoURL = ""
    
    init() {}
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        detail <- map["description"]
        smallArtworkURL <- map["small_artwork_url"]
        largeArtworkURL <- map["large_artwork_url"]
        videoURL <- map["web_url"]
    }
    
}
