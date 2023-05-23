//
//  WisdomeSharedNav.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 09/05/23.
//

import Foundation
import UIKit

class WisdomeSharedNav : BaseNavigationController{
    
    var viewModel : WisdomeSharedViewModel! {
        didSet{
            bindViewModel()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension WisdomeSharedNav {
    private func bindViewModel(){
        viewModel.currentWorkingSharedView.bindAndFire { view in
            self.presentWIWView(view: view)
        }
        
    }
}
extension WisdomeSharedNav{
    private func presentWIWView(view: WisdomeSharedView){
        switch view {
        case .wisdomeList :
                self.presentCurrentWorkingVC()
        case .loader:
            self.loaderView()
        }
    }
}
extension WisdomeSharedNav {
    private func presentCurrentWorkingVC() {
        let currentWorkingVC = NewsViewController.load(from: .main)
        currentWorkingVC.viewModel = NewsViewModel(wisdomResponder: self.viewModel)
        pushViewController(currentWorkingVC, animated: true)
    }
    
    private func loaderView(){
//        let loadingVC = LoadingViewController()
//        // Animate loadingVC over the existing views on screen
//        loadingVC.modalPresentationStyle = .automatic
//        // Animate loadingVC with a fade in animation
//        loadingVC.modalTransitionStyle = .crossDissolve
//        present(loadingVC, animated: true, completion: nil)
    }
}
