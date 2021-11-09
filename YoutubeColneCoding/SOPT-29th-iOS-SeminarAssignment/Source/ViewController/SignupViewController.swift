//
//  SignupViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/08.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Properties
    
    private var textFieldList = [UITextField]()
    private var passwordTextFieldIsSecurity = true
    @IBOutlet weak var checkboxButton: UIButton!
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initTextFieldEmpty()
    }
    
    // MARK: - @IBOutlet Properties
    
    @IBAction func touchSignupButton(_ sender: Any) {
        postSignupWithAPI()
    }
    @IBAction func touchPasswordTextFieldSecure(_ sender: Any) {
        if passwordTextFieldIsSecurity {
            checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            checkboxButton.tintColor = .systemBlue
            passwordTextField.isSecureTextEntry = false
            passwordTextFieldIsSecurity = false
        } else {
            checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
            checkboxButton.tintColor = .lightGray
            passwordTextField.isSecureTextEntry = true
            passwordTextFieldIsSecurity = true
        }
    }
}

// MARK: - Extensions

extension SignupViewController {
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
    private func presentToCheckinViewController() {
        let storyboard = UIStoryboard(name: Const.Storyboard.Name.checkin, bundle: nil)
        guard let checkinVC = storyboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.checkin) as? CheckinViewController else {
            return
        }

        checkinVC.modalPresentationStyle = .fullScreen
        present(checkinVC, animated: true, completion: nil)
    }
}

// MARK: - Network

extension SignupViewController {
    func postSignupWithAPI() {
        SignupService.shared.signup(email: contactTextField.text ?? "", name: nameTextField.text ?? "", password: passwordTextField.text ?? "") { response in
            switch response {
            case .success(let signupResponse):
                if let data = signupResponse as? SignupResponseModel {
                    UserDefaults.standard.set(data.name, forKey: Const.UserDefaults.Key.userName)
                    self.makeAlert(title: "회원가입", message: "회원 가입 성공", okAction: { _ in
                        self.presentToCheckinViewController()
                    })
                }
            case .requestErr(let message):
                if let message = message as? String {
                    self.makeAlert(title: "회원가입", message: message)
                }
            case .pathErr:
                print("postSignupWithAPI- pathErr")
            case .serverErr:
                print("postSignupWithAPI - serverErr")
            case .networkFail:
                print("postSignupWithAPI - networkFail")
            }
            
        }
    }
}

// MARK: - UITextFieldDelegate

extension SignupViewController: UITextFieldDelegate {
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
