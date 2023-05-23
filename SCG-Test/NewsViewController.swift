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
    private let searchVC = UISearchController(searchResultsController: nil)
    
    var viewModel: NewsViewModel? {
        didSet {
            configureView(with: viewModel)
            bindViewModel()
        }
    }
    
    // var newsVM = NewsVM.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        navigationBar()
        let params = ["country": "in",
                      "appid":Secret.secretKey] as [String : String]
        viewModel?.fetchWisdomList(parameters: params)

        let array = [1, 3, 5, 7, 9]
        let middleIndex =  findMiddleIndex(array) ?? 0 // sumLeftRightElements(numberArray: [1, 3, 5, 7, 9])
        print(array[middleIndex])
        // Do any additional setup after loading the view.
    }

    private func createSearchBar() {
        searchVC.searchBar.autocapitalizationType = .allCharacters
        searchVC.searchResultsUpdater = self
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchVC
            // Make the search bar always visible.
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // For iOS 10 and earlier, place the search controller's search bar in the table view's header.
            newsTableView.tableHeaderView = searchVC.searchBar
        }
        searchVC.searchBar.delegate = self
        searchVC.searchBar.sizeToFit()
        searchVC.searchBar.backgroundColor = .white
        searchVC.dimsBackgroundDuringPresentation = false // The default is true.
//        navigationItem.searchController = searchVC
        //        searchVC.searchBar.delegate = self
        //        searchVC.searchBar.backgroundColor = .white
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
    
    func navigationBar() {
        let label = UILabel()
        label.text = viewModel?.title
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        self.navigationItem.titleView = label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
        
        navigationController?.view.backgroundColor = .systemGreen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsDetails" {
           
            let details = segue.destination as? UINavigationController
            let row = viewModel?.getCellViewModel(for: 0, row: sender as! Int) as? WisdomeListCellRow
            let vc = details?.topViewController as? NewsDetailsViewController
            vc?.newsArticle = row?.item ?? Article(source: Source.init(name: ""), title: "", description: "", url: "", urlToImage: "", publishedAt: "")
        }
    }
   
    func willPresentSearchController(searchController: UISearchController) {
        self.navigationController?.navigationBar.isTranslucent = true
    }

    func willDismissSearchController(searchController: UISearchController) {
        self.navigationController?.navigationBar.isTranslucent = false
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
                self.searchVC.dismiss(animated: true, completion: nil)
            }
        })
    }
}

extension NewsViewController : UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
    
    //Search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let params = ["q": text,
                      "appid":Secret.secretKey,
                      "sortBy":"popularity"] as [String : String]
        viewModel?.searchList(parameters: params)
    }
}

// revolution game india private limited
