//
//  Router.swift
//  Week10
//
//  Created by 마르 on 2023/09/20.
//

import Foundation
import Alamofire

// SeSACAPI 개선. URLRequestConvertible를 통해 네트워크 라우터 패턴 추상화.

enum Router: URLRequestConvertible {
    
    static let key = "o4PRCCqQGMYVIxuEC-seOOEn3GWCzpLAOGvD3iuZzY0"
    
    case search(query: String)
    case random
    case photo(id: String) 
    
    private var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }
    
    private var path: String {
        switch self {
        case .search:
            return "search/photos"
        case .random:
            return "photos/random"
        case .photo(let id):
            return "photos/\(id)"
        }
    }
    
    private var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(Router.key)"]
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var query: [String : String] {
        
        switch self {
        case .search(let query):
            return ["query" : query]
        case .random, .photo:
            return ["" : ""]
            
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request.headers = header
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
    }
    
}
