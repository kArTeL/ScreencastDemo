//
//  EpisodeListTableViewController.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 24/3/21.
//

import UIKit
import RxSwift
import RxCocoa

class EpisodeListTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var episodeListViewModel = EpisodeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suscribeSignals()
        episodeListViewModel.getData()
    }

    
    /// Suscribe signals.
    func suscribeSignals() {
        episodeListViewModel.data.subscribeOn(MainScheduler.instance).subscribe({ [weak self] (_) in
            if let strongSelf = self {
                strongSelf.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return episodeListViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeListViewModel.numberOfRows(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? EpisodeTableViewCell else {
            fatalError("cellIdentifier is not the cell identifier or Cell is not EpisodeTableViewCell")
        }
        
        let episode = episodeListViewModel.object(atIndexPath: indexPath)
        let episodeViewModel = EpisodeViewModel(episode: episode)
        
        cell.setupCell(title: episodeViewModel.title, detail: episodeViewModel.detail, artworkURL: episodeViewModel.smallArtwork)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodeListViewModel.object(atIndexPath: indexPath)
        let episodeViewModel = EpisodeViewModel(episode: episode)
        performSegue(withIdentifier: "episodeDetailSegue", sender: episodeViewModel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "episodeDetailSegue", let episodeViewModel = sender as? EpisodeViewModel, let episodeDetailViewController = segue.destination as? EpisodeDetailViewController {
            episodeDetailViewController.episodeViewModel = episodeViewModel
        }
    }
    
    
    
    

}
