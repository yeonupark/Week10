//
//  BeerNetwork.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import Foundation
import Alamofire

class BeerNetwork {
    
    static let shared = BeerNetwork()
    
    private init() { }
    
    func request<T: Decodable>(type: T.Type, api: BeerAPI, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString))
            .responseDecodable(of: T.self) { response in
                
                switch response.result {
                case .success(let data) :
                    completion(.success(data))
                case .failure(let data) :
//                    let statusCode = response.response?.statusCode ?? 500
//                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completion(.failure(data))
                }
            }
    }
}
