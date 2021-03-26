//
//  EpisodeViewModel.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 24/3/21.
//

import Foundation

class EpisodeViewModel {
    
    var episode = MEpisode()
    
    init() {}
    
    init(episode: MEpisode) {
        self.episode = episode
    }
    
    var title: String {
        return episode.title
    }
    
    var detail: String {
        return episode.detail
    }
    
    var smallArtwork: URL? {
        return URL(string: episode.smallArtworkURL)
    }
    
    var largeArtwork: URL? {
        return URL(string: episode.largeArtworkURL)
    }
    
    var videoURL: URL? {
        return URL(string: episode.videoURL)
    }
}
