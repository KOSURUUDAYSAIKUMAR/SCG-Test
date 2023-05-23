//
//  NewsDetailsViewController.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 23/05/23.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var newsArticle = Article(source: Source.init(name: ""), title: "", description: "", url: "", urlToImage: "", publishedAt: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(newsArticle)//
       // self.title = "Details"
        navigationBar()
        if let url = newsArticle.urlToImage {
            SDWebImageManager.shared.loadImage(with: URL(string: url),options: .highPriority, progress: nil) { (image, data, error, cacheType, isFinished, imageUrl) in
                DispatchQueue.main.async {
                    self.detailImageView.image = image
                }
            }
        }
        titleLabel.text = newsArticle.title
        descriptionLabel.text = newsArticle.description
        if let formattedDate = Date.formattedString(from: newsArticle.publishedAt) {
            timeLabel.text = "Updated : " + formattedDate
        } else {
            timeLabel.text = "Invalid Date"
        }
        // Do any additional setup after loading the view.
    }
    
    func navigationBar() {
        let label = UILabel()
        label.text = "Details"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        self.navigationItem.titleView = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
        navigationController?.view.backgroundColor = .systemGreen
        let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "back-arrow"), for: .normal)
            button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backAction(_ : )), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
            button.sizeToFit()
        let barButton = UIBarButtonItem(customView: button)
            navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func backAction(_ sender: UIBarButtonItem){
          // uncomment according to your need
          // removing the current screen from view controller stack

          // self.navigationController?.popViewController(animated: true)

          // going to root view controller
          // self.navigationController?.popToRootViewController(animated: true)
          // works only when the view controller is push modelly
          self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//let spacing:CGFloat = 10.0; // the amount of spacing to appear between image and title
//    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
//    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
