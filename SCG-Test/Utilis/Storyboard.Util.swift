//
//  Storyboard.Util.swift
//  WisdomTask
//
//  Created by  Keerthana G on 07/12/22.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum StoryboardEnumerated: String {
        case launchScreen
        case main
    }
}

extension UIStoryboard.StoryboardEnumerated {
    var filename: String {
        return rawValue.captalizeFirstLetter
    }
    
    var instance: UIStoryboard {
        return UIStoryboard(name: filename, bundle: Bundle.main)
    }
    
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instance.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.self) ")
        }
        return viewController
    }
}
