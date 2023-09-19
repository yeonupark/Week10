//
//  Network.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import Foundation
import Alamofire

// 세개 합쳐서 하나로 통일
class Network {
    
    static let shared = Network()
    
    private init() { }
    
    func request<T: Decodable>(type: T.Type, api: SeSACAPI, completion: @escaping (Result<T, SeSACError>) -> Void) {
        
        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data) :
                    completion(.success(data))
                case .failure(_) :
                    //guard let statusCode = response.response?.statusCode else { return }
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    
                    completion(.failure(error))
                }
            }
    }
}
