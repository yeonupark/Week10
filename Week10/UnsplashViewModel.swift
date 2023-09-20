//
//  UnsplashViewModel.swift
//  Week10
//
//  Created by 마르 on 2023/09/20.
//

import Foundation

// 어차피 상속 안되는 애면 final 붙여주기
final class UnsplashViewModel {
    
    func request(completion: @escaping (URL) -> Void ) {
        Network.shared.requestConvertible(type: PhotoResult.self, api: .random) { response in
            switch response {
            case .success(let success):
                dump(success)
                let link = success.urls.thumb
                completion(URL(string: link)!)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
    }
    
}
