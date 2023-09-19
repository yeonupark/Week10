//
//  BeerViewController.swift
//  Week10
//
//  Created by 마르 on 2023/09/19.
//

import UIKit

class BeerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BeerNetwork.shared.request(type: [Beer].self, api: .randomBeer) { response in
            switch response {
            case .success(let success):
                print("[ Get random beer ]")
                dump(success)
            case .failure(let failure):
                print(failure)
            }
        }
        BeerNetwork.shared.request(type: [Beer].self, api: .singleBeer(id: 20)) { response in
            switch response {
            case .success(let success):
                print("[ Get single Beer ]")
                dump(success)
            case .failure(let failure):
                print(failure)
            }
        }
        BeerNetwork.shared.request(type: [Beer].self, api: .beers(queryName: "beer_name", queryContent: "Rabiator")) { response in
            switch response {
            case .success(let success):
                print("[ Get beers ]")
                dump(success)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }

}
