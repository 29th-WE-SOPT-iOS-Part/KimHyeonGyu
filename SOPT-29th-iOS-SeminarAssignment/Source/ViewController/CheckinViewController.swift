//
//  CheckinViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/08.
//

import UIKit

class CheckinViewController: UIViewController {
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - @IBOutlet Properties
    
    @IBAction func dismissToPrevious(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension CheckinViewController {
    private func setUI() {
        userNameLabel.text = userName
    }
}

