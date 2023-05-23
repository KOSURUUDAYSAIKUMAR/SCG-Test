//
//  UIViewController+ViewStatus.swift
//  WisdomTask
//
//  Created by  Keerthana G on 10/01/23.
//

import Foundation
import UIKit

//var viewModel: BaseViewController! {
//    didSet {
//
//    }
//}
var viewModel = BaseViewController()
extension UIViewController{
    func configureView(with viewModel: BaseViewModel?) {
        guard let viewModel = viewModel else { return }
        viewModel.viewStatus.bind { [weak self](viewState) in
            DispatchQueue.main.async {
                self?.bindBaseViewModel(with: viewState)
            }
        }
    }
    private func bindBaseViewModel(with viewStatus: ViewStatus) {
        DispatchQueue.main.async { [weak self] in
            switch viewStatus {
            case .idel, .loaded:
                self?.removeLoaderErrorViewFromSuperview()
            case .loading(let loadStyle, let title):
//                self?.view.endEditing(true)
                self?.displayLoading(title: title, loadStyle: loadStyle)
            }
        }
    }
    private func displayLoading(title: String?, loadStyle: LoadingStyle){
        switch loadStyle {
        case .covering:
            showCoveringLoader(onView: view, title: title)
        case .dark:
            showDarkLoader(onView: view, title: title)
        }
    }
    fileprivate func removeLoaderErrorViewFromSuperview() {
        // remove loading indicator
        removeSpinner(onView: view)
    }
}

extension UIViewController {

    func showCoveringLoader(onView : UIView, title: String?) {
        
       // showIndicator(onView: onView, withtitle: title, and: subtitle)
        viewModel.showIndicator(onView: self.view, withtitle: title, and: "")
        //showIndicator(onView: onView, withtitle: title, and: subtitle)
      
    }
    func showDarkLoader(onView : UIView, title: String?) {
        // can be customized differently if needed
        //        showDarkStyleIndicator(withtitle: title, and: subtitle)
        showDarkStyleIndicator(withtitle: title, and: "")
    }
    func removeSpinner(onView : UIView) {
        //hideLoadingIndicator(onView: onView)
        viewModel.hideIndicator(onView: onView)
        //hideLoadingIndicator()
    }
}

