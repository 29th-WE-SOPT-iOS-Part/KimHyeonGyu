//
//  SignupService.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//

import Foundation
import Alamofire

struct SignupService {
    static let shared = SignupService()
    
    func signup(email: String,
                name: String,
                password: String,
                completion: @escaping ((NetworkResult<Any>) -> Void)) {
    
        let url = Const.URL.signupURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email" : email,
            "name" : name,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.data else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidSignupData(data: data, valid: true)
        // ❗️4차 - 대표적으로 잘못된 경로를 요청하는 404 의 경우도 분기처리하기 위해서 400~499 로 설정
        case 400..<500: return isValidSignupData(data: data, valid: false)
        case 500: return .serverErr
        default : return .networkFail
        }
    }
    
    private func isValidSignupData(data: Data, valid: Bool) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignupResponseModel>.self, from: data) else { return .pathErr }
        if valid {
            return .success(decodedData.data)
        } else {
            return .requestErr(decodedData.message)
        }
    }
}
