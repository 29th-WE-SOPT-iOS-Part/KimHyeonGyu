//
//  DetailViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    var thumbnailImage: String?
    var titleText: String?
    var subtitleText: String?
    
    // MARK: - @IBOutlet Properteis
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchDismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController {
    private func setUI() {
        if let thumbnailImage = thumbnailImage, let image = UIImage(named: thumbnailImage) {
            thumbnailImageView.image = image
        }
        
        titleLabel.numberOfLines = 2
        titleLabel.text = titleText
        
        subtitleLabel.text = subtitleText
    }
}
