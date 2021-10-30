//
//  ViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var textFieldList = [UITextField]()
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        initTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initTextFieldEmpty()
    }
    
    // MARK: - @IBOutlet Properties
    
    @IBAction func touchSignupButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Const.Storyboard.Name.signup, bundle: nil)
        guard let signupVC = storyboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signup) as? SignupViewController else {
            return
        }

        navigationController?.pushViewController(signupVC, animated: true)
    }
    @IBAction func touchCheckinButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Const.Storyboard.Name.checkin, bundle: nil)
        guard let checkinVC = storyboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.checkin) as? CheckinViewController else {
            return
        }
        
        checkinVC.userName = nameTextField.text
        checkinVC.modalPresentationStyle = .fullScreen
        present(checkinVC, animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension LoginViewController {
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    private func initTextField() {
        // UITextField 배열에 추가해서 forEach() 메서드로 UI,delegate 등을 통일적으로 적용 가능.
        textFieldList.append(contentsOf: [nameTextField,
                                          contactTextField,
                                          passwordTextField])
        textFieldList.forEach { $0.delegate = self }
    }
    private func initTextFieldEmpty() {
        textFieldList.forEach {
            $0.text = ""
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && contactTextField.hasText && passwordTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    // 키보드의 리턴키를 눌렀을 때 키보드 다운.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
