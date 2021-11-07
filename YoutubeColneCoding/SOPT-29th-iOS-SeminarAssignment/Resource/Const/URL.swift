//
//  URL.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//

import Foundation

extension Const {
    struct URL {
        // MARK: - Base URL
        static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
        
        // MARK: - Feature URL
        static let signupURL = baseURL + "/user/signup"
        static let loginURL = baseURL + "/user/login"
    }
}
