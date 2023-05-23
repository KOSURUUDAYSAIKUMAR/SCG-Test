//
//  SCGListRouter.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import Foundation

enum WisdomeApiRouter {
    case list(page:[String:Any])
    case search(page:[String:Any])
}

extension WisdomeApiRouter: NetworkConfiguration {
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        case .search:
            return .get
        }
    }
    var path: String? {
        switch self {
        case .list:
            return APIConstants.list
        case .search:
            return APIConstants.search
        }
    }
    var headers: [String : String]? {
        switch self {
        case .list, .search:
            return ["Content-Type":"application/json"]
        }
    }
    var bodyparameters: [String : Any]? {
        switch self {
        case .list(let urlParams):
            return ["country":urlParams["country"]!,
                    "apiKey":urlParams["appid"]!]
        case .search(page: let searchQuers):
            return ["sortBy":searchQuers["sortBy"]!,
                    "q":searchQuers["q"]!,
                    "apikey":searchQuers["appid"]!]
        }
    }
}

