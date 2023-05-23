//
//  ViewController.Util.swift
//  WorkerlyAgent(MVVM)
//
//  Created by  Keerthana G on 07/12/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func load(from storyboard: UIStoryboard.StoryboardEnumerated) -> Self {
        return storyboard.instantiateViewController()
    }
    func moveRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transition(with: SCENE_DELEGATE.window!, duration: 0.7, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                SCENE_DELEGATE.window?.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            SCENE_DELEGATE.window?.rootViewController = rootViewController
        }
    }
    
}
