//
//  WisdomeListCell.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 09/05/23.
//

import Foundation
import UIKit
import SDWebImage

class WisdomeListCell : UITableViewCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var subtitle : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    @IBOutlet weak var _imageView: UIImageView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var cellViewModel : WisdomeListCellRow! {
        didSet {
            accessoryType = .none
            title.text = cellViewModel.item?.title
            subtitle.text = cellViewModel.item?.description
            if let formattedDate = Date.formattedString(from: cellViewModel.item?.publishedAt ?? "") {
                timeLabel.text = formattedDate
            } else {
                timeLabel.text = "Invalid date"
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        _imageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedBackgroundView = {
            let view = UIView.init()
            view.backgroundColor = .white
            return view
        }()
    }
}
