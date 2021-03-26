//
//  EpisodeTableViewCell.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 24/3/21.
//

import UIKit
import SDWebImage

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func setupCell(title: String, detail: String, artworkURL: URL?) {
        titleLabel.text = title
        detailLabel.text = detail
        artworkImageView.sd_setImage(with: artworkURL)
        
    }
}
