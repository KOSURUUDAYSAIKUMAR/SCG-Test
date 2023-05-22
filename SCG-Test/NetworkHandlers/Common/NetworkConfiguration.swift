//
//  NetworkConfiguration.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.


import Foundation

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
}

protocol NetworkConfiguration {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String? { get }
    var bodyparameters: [String: Any]? { get }
    var headers: [String : String]? { get }
}

extension NetworkConfiguration {
    var baseURL: String {
        return APIConstants.baseUrl
    }
    var oAuthToken: String {
        return ""
    }
    var timeoutInterval: TimeInterval {
        return 60.0
    }
}
