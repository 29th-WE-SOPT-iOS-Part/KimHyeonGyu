//
//  GenericResponse.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case status
        case success
        case message
        case data
    }
    
    // ❗️4차 - 직접 decode 를 해서 서버에서 비어있는 key-value 가 넘어오게되면 기본값을 넣어주는 예외처리.
    // 이렇게 하면 서버에서 key-value 를 넘겨주지 않더라도 앱이 갑자기 죽지 않아요! 또는 모든 타입을 옵셔널로 처리해주는 방법도 있어요.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
