//
//  SignupResponseModel.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//

import Foundation

// post 요청시 response body 가 될 model
struct SignupResponseModel: Codable {
    let id: Int
    let name: String
//    let password: String
    let email: String
}
