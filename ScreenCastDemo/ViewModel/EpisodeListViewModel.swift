//
//  EpisodeListViewModel.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 24/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class EpisodeListViewModel: BaseListViewModel<MEpisode> {
    
    //get data
    override func getData() {
        apiProvider.rx.request(.episodes).mapObject(MEpisodeResponse.self).subscribe(onSuccess: { [weak self] (response) in
            if let responseEpisodeList = response.episodeList, let strongSelf = self {
                strongSelf.data.accept(responseEpisodeList)
            }
        }, onError: { (error) in

        }).disposed(by: diposeBag)
    }
    
}
