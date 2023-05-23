//
//  ViewController.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import UIKit
import SDWebImage

class NewsViewController: BaseViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var viewModel: NewsViewModel? {
        didSet {
            configureView(with: viewModel)
            bindViewModel()
        }
    }
    // var newsVM = NewsVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.title
        let params = ["country": "in",
                      "appid":Secret.secretKey] as [String : String]
        viewModel?.fetchWisdomList(parameters: params)
        
//
//        newsVM.getDataFromServer(params: params) { model in
//            model.articles.forEach({ articles in
//                print(articles.title)
//            })
//            print(model.articles.count)
//        }
        
        var array = [1, 3, 5, 7, 9]
        let middleIndex =  findMiddleIndex(array) ?? 0 // sumLeftRightElements(numberArray: [1, 3, 5, 7, 9])
        print(array[middleIndex])
        // Do any additional setup after loading the view.
    }

    func findMiddleIndex(_ array: [Int]) -> Int? {
        let totalCount = array.count
        // Special case: Empty array
        if totalCount == 0 {
            return nil
        }
        // Special case: Single element array
        if totalCount == 1 {
            return 0
        }
        var leftSum = 0
        var rightSum = array[1..<totalCount].reduce(0, +)
        print("right sum ----", rightSum)
        for index in 0..<totalCount {
            if leftSum == rightSum {
                return index
            }
            if index < totalCount - 1 {
                leftSum += array[index]
                rightSum -= array[index + 1]
            }
        }
        return nil
    }
    
    func isPalindrome(_ input: String) -> Bool {
        let characters = Array(input.lowercased())
        let count = characters.count
        let midIndex = count / 2
        for index in 0..<midIndex {
            if characters[index] != characters[count - 1 - index] {
                return false
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsDetails" {
            let details = segue.destination as? UINavigationController
            let row = viewModel?.getCellViewModel(for: 0, row: sender as! Int) as? WisdomeListCellRow
            let vc = details?.topViewController as? NewsDetailsViewController
            vc?.newsArticle = row?.item ?? Article(source: Source.init(name: ""), title: "", description: "", url: "", urlToImage: "", publishedAt: "")
        }
    }
   
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(for: section) ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = viewModel?.getSectionType(for: indexPath.section)
        switch type{
        case .wisdomeSection:
            let cell : WisdomeListCell? = tableView.dequeueReusableCell(withIdentifier: "WisdomeListCell", for: indexPath) as? WisdomeListCell
            if let cellViewModel = viewModel?.getCellViewModel(for: indexPath.section, row: indexPath.row) as? WisdomeListCellRow {
                cell?.cellViewModel = cellViewModel
                if let url = cellViewModel.item?.urlToImage {
                    SDWebImageManager.shared.loadImage(with: URL(string: url),options: .highPriority, progress: nil) { (image, data, error, cacheType, isFinished, imageUrl) in
                        DispatchQueue.main.async {
                            cell?._imageView.image = image
                        }
                    }
                }
            }
            return cell!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newsDetails", sender: indexPath.row)
    }
}

extension NewsViewController {
    private func bindViewModel() {
        viewModel?.tableViewCellViewModel.bind({ [self] section in
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        })
    }
}


// revolution game india private limited
