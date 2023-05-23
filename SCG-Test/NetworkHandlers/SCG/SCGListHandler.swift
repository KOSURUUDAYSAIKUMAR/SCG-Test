//
//  SCGListHandler.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import Foundation
import UIKit

class WisdomListHandler {
    func fetchWisdomeList(perPage:[String:Any], completion: @escaping (NewsModel?, APIError?) ->Void) {
        let wisdomeListRouter = WisdomeApiRouter.list(page: perPage)
        NetworkHandler().makeAPICall(router: wisdomeListRouter, decodingType: NewsModel.self) { (result) in
            switch result {
            case .success(let model):
                completion(model as? NewsModel, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    func fetchImage(url:String, id:String, completion: @escaping (UIImage?, APIError?) ->Void){
        NetworkHandler().downlodDirect(urlString: url,id: id) { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let image = UIImage(data: data){
                        completion(image, nil)
                    }
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
