//
//  ChannelCollectionViewCell.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/29.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    
    func setDataWith(channelImage: String,
                     channelText: String) {
        if let image = UIImage(named: channelImage) {
            channelImageView.image = image
        }
        channelLabel.text = channelText
    }
}
