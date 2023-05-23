//
//  NewsVM.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import UIKit

class NewsVM: NSObject {
    static var shared = NewsVM()
    
    func getDataFromServer(params: [String:String], completionHandler: @escaping (NewsModel) -> Void) {
        WisdomListHandler().fetchWisdomeList(perPage: params) { news, error in
            completionHandler(news!)
        }
    }
}
