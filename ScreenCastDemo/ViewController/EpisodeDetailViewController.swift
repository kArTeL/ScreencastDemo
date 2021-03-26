//
//  EpisodeDetailViewController.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 26/3/21.
//

import UIKit
import SDWebImage
import SafariServices
import WebKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeDetailLabel: UILabel!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    lazy var episodeViewModel = EpisodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        title = episodeViewModel.title
        episodeDetailLabel.text = episodeViewModel.detail
        episodeTitleLabel.text = episodeViewModel.title
        episodeImageView.sd_setImage(with: episodeViewModel.largeArtwork)
        
    }
    
    @IBAction func goToVideoButtonPressed(_ sender: Any) {
        if let url = episodeViewModel.videoURL {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true

               let vc = SFSafariViewController(url: url, configuration: config)
               present(vc, animated: true)
           }
    }
    
}
