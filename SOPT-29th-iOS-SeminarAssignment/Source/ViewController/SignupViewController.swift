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
    
    // MARK: - @IBOutlet Properties
    
    @IBAction func touchSignupButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Const.Storyboard.Name.checkin, bundle: nil)
        guard let checkinVC = storyboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.checkin) as? CheckinViewController else {
            return
        }
        
        checkinVC.userName = nameTextField.text
        checkinVC.modalPresentationStyle = .overFullScreen
        present(checkinVC, animated: true, completion: nil)
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
