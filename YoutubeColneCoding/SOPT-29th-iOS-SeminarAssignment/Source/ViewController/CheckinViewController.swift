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
    
    @IBAction func touchCheckinButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Const.Storyboard.Name.tabbar, bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.tabbar) as? TabBarViewController else { return }
        
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func touchLoginButton(_ sender: Any) {
        // ✅ popToRootViewController 메서드 사용
//        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
//        self.dismiss(animated: true) {
//            presentingVC.popToRootViewController(animated: true)
//        }
        
        // ✅ popToViewController 메서드 사용
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        let viewControllerStack = presentingVC.viewControllers
        self.dismiss(animated: true) {
            for viewController in viewControllerStack {
                if let rootVC = viewController as? LoginViewController {
                    presentingVC.popToViewController(rootVC, animated: true)
                }
            }
        }
    }
}

// MARK: - Extensions

extension CheckinViewController {
    private func setUI() {
        userNameLabel.text =  UserDefaults.standard.string(forKey: Const.UserDefaults.Key.userName)
    }
}

