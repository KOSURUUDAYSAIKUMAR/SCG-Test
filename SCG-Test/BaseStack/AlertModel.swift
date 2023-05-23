//
//  AlertModel.swift
//  WisdomTask
//
//  Created by  Keerthana G on 06/01/23.
//

import Foundation

struct AlertModel {
    let id: String?
    let title: String?
    let message: String?
    let okTitle: String?
    let cancelTitle: String?
    let completion: (()->Void)?
    
    init(id: String? = nil,
         title: String,
         message: String,
         okTitle: String? = nil,
         cancelTitle: String? = nil,
         completion: (()->Void)? = nil)
    {
        self.title = title
        self.id = id
        self.message = message
        self.okTitle = okTitle
        self.cancelTitle = cancelTitle
        self.completion = completion
    }
}
enum AlertPresentation {
    case presentation(id: String??)
    case cancel(id: String?)
    case ok(id: String?)
    
}
