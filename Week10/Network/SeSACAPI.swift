//
//  UnsplashAPI.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import Foundation
import Alamofire

enum SeSACAPI {
    static let key = "o4PRCCqQGMYVIxuEC-seOOEn3GWCzpLAOGvD3iuZzY0"
    
    case search(query: String)
    case random
    case photo(id: String) // assosiate value (연관값)
    
    private var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var endpoint: URL {
        switch self {
        case .search:
            return URL(string: baseURL + "search/photos")!
        case .random:
            return URL(string: baseURL + "photos/random")!
        case .photo(let id):
            return URL(string: baseURL + "photos/\(id)")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(SeSACAPI.key)"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: Parameters {
        
        switch self {
        case .search(let query):
            return ["query" : query]
        case .random, .photo:
            return ["" : ""]
            
        }
    }
}













