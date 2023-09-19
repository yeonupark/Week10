//
//  BeerAPI.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerAPI {
    
    case beers(queryName: String, queryContent: String)
    case singleBeer(id: Int)
    case randomBeer
    
    private var baseURL: String {
        return "https://api.punkapi.com/v2/beers/"
    }
    
    var endpoint: URL {
        switch self {
        case .beers:
            return URL(string: baseURL)!
        case .singleBeer(let id):
            return URL(string: baseURL + "\(id)")!
        case .randomBeer:
            return URL(string: baseURL + "random")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: Parameters {
        
        switch self {
        case .beers(let queryName, let queryContent):
            return [queryName : queryContent]
        case .singleBeer, .randomBeer:
            return ["" : ""]
        }
    }
}
