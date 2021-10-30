//
//  ThumbnailTableViewCell.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/29.
//

import UIKit

class ThumbnailTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Methods
    
    func setDataWith(thumbnailImage: String,
                             channelImage: String,
                             titleText: String,
                             subtitleText: String) {
        if let thumbnailImage = UIImage(named: thumbnailImage) {
            thumbnailImageView.image = thumbnailImage
        }
        if let channelImage = UIImage(named: channelImage) {
            channelImageView.image = channelImage
        }
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
}
