//
//  NetworkResult.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/11/07.
//
import Foundation

enum NetworkResult<T> {
    case success(T, T)         // 서버통신 성공
    case requestErr(T)      // 요청 에러
    case pathErr            // 경로 에러
    case serverErr          // 서버 내부 에러
    case networkFail        // 네트워크 연결 실패
}
