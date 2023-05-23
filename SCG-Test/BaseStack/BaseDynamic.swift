//
//  BaseDynamic.swift
//  WisdomTask
//
//  Created by  Keerthana G on 07/12/22.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(value: T) {
        self.value = value
    }

}
