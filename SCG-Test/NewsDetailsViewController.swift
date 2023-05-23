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
        print(newsArticle)
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
            timeLabel.text = formattedDate
        } else {
            timeLabel.text = "Invalid Date"
        }
        // Do any additional setup after loading the view.
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
