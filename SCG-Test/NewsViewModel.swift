//
//  NewsViewModel.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import UIKit

class NewsViewModel: BaseViewModel {
    
    var title = "News"
    var tableViewHeight = UITableView.automaticDimension
    
    var wisdomResponder : WisdomResponder
    let tableViewCellViewModel = Dynamic<[WisdomeListCellViewModelBase]>(value: [])
        init(wisdomResponder: WisdomResponder) {
        self.wisdomResponder = wisdomResponder
        super.init()
    }
  
}

extension NewsViewModel {
    func numberOfSections() -> Int {
        self.tableViewCellViewModel.value.count
    }
    func numberOfRows(for section: Int) -> Int {
        return tableViewCellViewModel.value[section].rowCount
    }
    func rowHeight(for indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func titleHeader(for section: Int) -> String {
        return tableViewCellViewModel.value[section].sectionTitle ?? ""
    }
    func getSectionType(for section:Int) -> WisdomeTableSectionType{
        return tableViewCellViewModel.value[section].type
    }
    func getRowType(for section:Int, row:Int) -> WisdomeTableRowType {
        let rowType = (tableViewCellViewModel.value[section].items?[row].rowType)!
        return rowType
    }
    func getCellViewModel(for section:Int, row: Int) -> WisdomeListCellRow {
        let sectionModel = tableViewCellViewModel.value[section]
        let rowViewModel = sectionModel.items?[row]
        return rowViewModel!
    }
//    func getModel(for section:Int, row: Int) -> Article {
//        let sectionModel = tableViewCellViewModel.value[section]
//        let rowViewModel = sectionModel.items?[row].item
//        return rowViewModel!
//    }
    func getCurrentWorkingCellViewModel(for section:Int, row: Int) -> WisdomeListCellViewModel? {
        let sectionModel = tableViewCellViewModel.value[section] as? WisdomeListCellViewModel
        return sectionModel
    }
}

extension NewsViewModel {
    func fetchWisdomList(parameters: [String:String]){
        viewStatus.value = .loading(loadStyle: .covering,title: "")
        WisdomListHandler().fetchWisdomeList(perPage: parameters) { model, error in
            if let err = error {
                print(":- \(err.localizedDescription)")
            }else{
                if let wisdome = model{
                    self.buildCellViewModels(items: wisdome.articles) { }
                }
            }
            self.viewStatus.value = .loaded
        }
    }
    
    func searchList(parameters: [String:String]){
        viewStatus.value = .loading(loadStyle: .covering,title: "")
        WisdomListHandler().fetchSearchList(perPage: parameters) { model, error in
            if let err = error {
                print(":- \(err.localizedDescription)")
            }else{
                if let wisdome = model{
                    self.buildCellViewModels(items: wisdome.articles) { }
                }
            }
            self.viewStatus.value = .loaded
        }
    }
    
    private func buildCellViewModels(items : [Article?], completion: @escaping () -> Void) {
        var sectionTable = [WisdomeListCellViewModelBase]()
        var whoIsWorkingRow = [WisdomeListCellRow]()
        for item in items {
          //  item?.url = randomString()
            let row = WisdomeListCellRow(rowType: .generalRow, item: item)
            whoIsWorkingRow.append(row)
        }
        let whoIsWorkingSection = WisdomeListCellViewModel(items: whoIsWorkingRow, sectionTitle: "", type: .wisdomeSection)
        sectionTable.append(whoIsWorkingSection)
        self.tableViewCellViewModel.value = sectionTable
        completion()
    }
}
