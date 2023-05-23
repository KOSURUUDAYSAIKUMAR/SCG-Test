//
//  LoaderViewStatus.swift
//  WisdomTask
//
//  Created by  Keerthana G on 28/12/22.
//

import Foundation

enum LoadingStyle {
    case covering
    case dark
}
enum ViewStatus {
    case idel
    case loading(loadStyle: LoadingStyle, title: String? = nil)
    case loaded
}
protocol RequestLoaderViewStatus {
    func loadingStyle() -> LoadingStyle
    func loadingTitle() -> String?
    func loadingSubTitle() -> String?
}

extension RequestLoaderViewStatus {
    func loadingStyle() -> LoadingStyle {
        return .covering
    }
    func loadingTitle() -> String? {
        return "Loading"
    }
    func loadingSubTitle() -> String? {
        return nil
    }
}
