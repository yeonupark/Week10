//
//  ViewController.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.request(type: Photo.self, api: .search(query: "cat")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
        
        Network.shared.request(type: PhotoResult.self, api: .random) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
        
        Network.shared.request(type: PhotoResult.self, api: .photo(id: "gKXKBY-C-Dk")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
    }

}


// Codable: Decodable + Encodable
struct Photo: Decodable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
    
}

struct PhotoResult: Decodable {
    let id: String
    let created_at: String
    let urls: PhotoURL
}

struct PhotoURL: Decodable {
    let full: String
    let thumb: String
}
