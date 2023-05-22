//
//  SCGListRouter.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import Foundation

enum WisdomeApiRouter {
    case list(page:String)
    case image(id:String)
}

extension WisdomeApiRouter: NetworkConfiguration {
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        case .image:
            return .get
        }
    }
    var path: String? {
        switch self {
        case .list:
            return APIConstants.list
        case .image:
            return APIConstants.image
        }
    }
    var headers: [String : String]? {
        switch self {
        case .list, .image:
            return ["Content-Type":"application/json"]
        }
    }
    var bodyparameters: [String : Any]? {
        switch self {
        case .list(let page):
            return ["page":page,
                    "limit":"20"]
        case .image(let id):
            return ["id":id]
        }
    }
}

