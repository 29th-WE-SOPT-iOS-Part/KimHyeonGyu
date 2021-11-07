//
//  CustomNavigationBar.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/28.
//

import Foundation
import UIKit

class CustomNavigationBar: UIView {
    
    // MARK: - Properties
    
    var presentingViewController: UIViewController?
    
    // MARK: - IBoutlet Properties
    
    @IBOutlet weak var profileButton: UIButton!
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        customInit()
    }
    
    // ✅ File's Owner 의 Custom Class 를 설정했을 때 사용하는 코드
//    func customInit() {
//        if let view = Bundle.main.loadNibNamed(Const.Xib.NibName.customNavigationBar, owner: self, options: nil)?.first as? UIView {
//            view.frame = self.bounds
//            addSubview(view)
//        }
//    }

    // ✅ profile button 을 터치하면 LoginViewController 로 화면전환.
    @IBAction func touchProfileButton(_ sender: Any) {
        // ❗️4차 - LoginViewController 에서 화면전환은 push 와 pop 을 사용하기 때문에 LoginViewController 를 rootViewController 로 가지는 UINavigationController 를 코드로 구현.
        guard let loginVC = UIStoryboard(name: Const.Storyboard.Name.login, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.login) as? LoginViewController else { return }
        let navigationController = UINavigationController(rootViewController: loginVC)
        
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        presentingViewController?.present(navigationController, animated: true, completion: nil)
    }
    
}
