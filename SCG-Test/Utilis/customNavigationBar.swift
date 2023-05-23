//
//  customNavigationBar.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 23/05/23.
//

import UIKit

class customNavigationBar: UINavigationBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UINavigationBar {
    func customNavigationBar() {
        // color for button images, indicators and etc.
        self.tintColor = UIColor.systemGreen

        // color for background of navigation bar
        // but if you use larget titles, then in viewDidLoad must write
        // navigationController?.view.backgroundColor = // your color
        self.barTintColor = .systemGreen
        self.isTranslucent = false

        // for larget titles
        self.prefersLargeTitles = true

        // color for large title label
        self.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // color for standard title label
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // remove bottom line/shadow
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}
