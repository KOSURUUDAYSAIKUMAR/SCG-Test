//
//  WisdomeSharedNavViewModel.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 09/05/23.
//

import Foundation
import UIKit

enum SCGSharedView  {
    case scgList
    case loader
}
class SCGSharedViewModel : BaseViewModel {
    let currentWorkingSharedView = Dynamic<SCGSharedView>(value: .scgList)
    
    init(with currentWorkingSharedView: SCGSharedView) {
        super.init()
        self.currentWorkingSharedView.value = currentWorkingSharedView
    }
    
    private func changViewState(to view: SCGSharedView){
        currentWorkingSharedView.value = view
    }
}
extension SCGSharedViewModel : WisdomResponder {
    func currentWorking() {
        changViewState(to: .scgList)
    }
    func loaderView() {
        changViewState(to: .loader)
    }
    
}
