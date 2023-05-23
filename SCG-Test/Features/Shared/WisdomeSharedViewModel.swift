//
//  WisdomeSharedNavViewModel.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 09/05/23.
//

import Foundation
import UIKit

enum WisdomeSharedView  {
    case wisdomeList
    case loader
}
class WisdomeSharedViewModel : BaseViewModel {
    let currentWorkingSharedView = Dynamic<WisdomeSharedView>(value: .wisdomeList)
    
    init(with currentWorkingSharedView: WisdomeSharedView) {
        super.init()
        self.currentWorkingSharedView.value = currentWorkingSharedView
    }
    
    private func changViewState(to view: WisdomeSharedView){
        currentWorkingSharedView.value = view
    }
}
extension WisdomeSharedViewModel : WisdomResponder {
    func currentWorking() {
        changViewState(to: .wisdomeList)
    }
    func loaderView() {
        changViewState(to: .loader)
    }
    
}
