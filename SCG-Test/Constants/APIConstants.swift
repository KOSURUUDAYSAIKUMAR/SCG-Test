//
//  APIConstants.swift
//  SCG
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.

// b172868a7b4d4de9ba17b2cfd083953a
import Foundation
typealias BoolCompletion = (_ success: Bool) -> Void

struct APIConstants {
    static let defaultTimeOut: Double = 120.0

    static var baseUrl: String {
        get {
            return AppGateway.sharedInstance.appGatewayEndPoint()
        }
    }
}

extension APIConstants {
    static let list = "top-headlines"
    static let image = "list?"
}
