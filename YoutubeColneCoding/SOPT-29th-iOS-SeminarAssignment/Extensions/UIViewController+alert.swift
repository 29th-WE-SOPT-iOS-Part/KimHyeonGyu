//
//  UIViewController+alert.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//

import UIKit


extension UIViewController {
    // ❗️4차 - UIAlertController 를 쉽게 만들 수 있도록 커스텀한 메서드.
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> ())? = nil)
    {
        // creates haptics to simulate physical impacts.
        let generator = UIImpactFeedbackGenerator(style: .medium)
        // triggers impoact feedback.
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
