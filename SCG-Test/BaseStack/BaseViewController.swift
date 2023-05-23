//
//  BaseViewController.swift
//  WisdomTask
//
//  Created by  Keerthana G on 07/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    var rightBarButton: UIBarButtonItem?
    
    var loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shouldShowLargeNavigationBarTitle = true
       // view.addSubview(loader)
        
    }
    var shouldShowLargeNavigationBarTitle: Bool? {
        didSet {
            if shouldShowLargeNavigationBarTitle ?? false {
                self.navigationController?.navigationBar.prefersLargeTitles = true
                self.navigationController?.navigationItem.largeTitleDisplayMode = .never
            } else {
                self.navigationController?.navigationBar.prefersLargeTitles = false
                self.navigationController?.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }
    
    var shouldShowNavigationBar: Bool? {
        didSet {
            if shouldShowNavigationBar ?? false {
                navigationController?.setNavigationBarHidden(false, animated: true)
            } else {
                navigationController?.setNavigationBarHidden(true, animated: true)
                
            }
        }
    }
    func showIndicator(onView: UIView, withtitle: String?, and subtitle: String?){
        loader.style = .large
        loader.center = onView.center
        onView.isUserInteractionEnabled = false
       //loader.isHidden = false
        loader.startAnimating()
        loader.layer.cornerCurve = .continuous
        loader.layer.cornerRadius = 10
        loader.backgroundColor = UIColor(white: 0.5, alpha: 0.3)

       // loader.layer.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).cgColor
        onView.addSubview(loader)
    }
    func hideIndicator(onView: UIView){
        //loader.isHidden = true
        onView.isUserInteractionEnabled = true
        loader.stopAnimating()
        loader.removeFromSuperview()
    }
//    var loadingActivityIndicator: UIActivityIndicatorView = {
//        // UIActivityIndicatorView Configuration
//        let indicator = UIActivityIndicatorView()
//        indicator.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        indicator.isHidden = false
//            indicator.style = .large
//            indicator.color = .white
//            indicator.startAnimating()
//            indicator.autoresizingMask = [
//                .flexibleLeftMargin, .flexibleRightMargin,
//                .flexibleTopMargin, .flexibleBottomMargin
//            ]
//        return indicator
//    }()
//
//    var blurEffectView: UIVisualEffectView = {
//        // UIVisualEffectView Configuration
//        let blurEffect = UIBlurEffect(style: .light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.alpha = 0.8
//        blurEffectView.autoresizingMask = [
//                .flexibleWidth, .flexibleHeight
//            ]
//        return blurEffectView
//    }()
//
    
}
