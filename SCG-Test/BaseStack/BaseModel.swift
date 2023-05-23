//
//  BaseModel.swift
//  WisdomTask
//
//  Created by  Keerthana G on 07/12/22.
//

import Foundation
import UIKit
//import CCBottomRefreshControl

protocol noInternetProtocal{
    func networkAvailable()
    func networkNotAvailable()
}
class BaseViewModel: RequestLoaderViewStatus {
    
    let viewStatus = Dynamic<ViewStatus>(value: .idel)
    let alertModel: Dynamic<AlertModel?> = Dynamic<AlertModel?>(value: nil)
    let alertPresentation = Dynamic<AlertPresentation?>(value: nil)
    var noInternetDelegate : noInternetProtocal?
    
    init() {
        bindAlertPresentation()
    }
    //MARK :- Refresh
    lazy var topRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemGray
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.sizeToFit()
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        
        return refreshControl
    }()
    
    lazy var bottomRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.sizeToFit()
     //   refreshControl.triggerVerticalOffset = 50.0
        refreshControl.addTarget(self, action: #selector(didPagenate(_:)), for: .valueChanged)
        return refreshControl
    }()
//    @objc func doRefresh(){
        
  //  }
    @objc func pullToRefresh(_ refreshControl: UIRefreshControl) {
        didPullToRefresh()
    }
    @objc func didPagenate(_ refreshControl: UIRefreshControl) {
        didPaginate()
    }
    func didPullToRefresh() {
        
    }
    func didPaginate() {
        
    }
    func addPullToRefreshControl(to tableView: UITableView) {
            tableView.refreshControl?.endRefreshing()
            tableView.refreshControl = topRefreshControl
            tableView.addSubview(topRefreshControl)
    }
    func addPaginateRefreshControl(to tableView: UITableView) {
        if #available(iOS 10.0, *) {
        //    tableView.bottomRefreshControl = bottomRefreshControl
        } else {
            tableView.addSubview(bottomRefreshControl)
        }
    }
    //MARK :- Alert Handling
    
    func bindAlertPresentation() {
        alertPresentation.bind { [weak self] indexBasedAlertPresentation in
            guard let indexBasedAlertPresentation = indexBasedAlertPresentation else { return }
            self?.alertAction(with: indexBasedAlertPresentation)
        }
    }
    func alertAction(with alertPresentation: AlertPresentation) {
        print("alertPresentation\(alertPresentation)")
    }
}
