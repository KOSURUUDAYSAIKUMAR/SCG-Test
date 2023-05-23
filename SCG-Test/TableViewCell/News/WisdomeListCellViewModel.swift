//
//  WisdomeListCellViewModel.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 09/05/23.
//

import Foundation
import UIKit

enum WisdomeTableSectionType : Int {
    case wisdomeSection
}
enum WisdomeTableRowType {
    case generalRow
}

protocol WisdomeListCellViewModelBase {
    var type: WisdomeTableSectionType { get }
    var sectionTitle: String? { get }
    var rowCount: Int { get }
    var items:[WisdomeListCellRow]? {get}
}

class WisdomeListCellViewModel : WisdomeListCellViewModelBase {
    var sectionTitle: String?
    var items : [WisdomeListCellRow]?
    var type : WisdomeTableSectionType
    var accessoryType: UITableViewCell.AccessoryType {
        return .none
    }
    var rowCount: Int {
        return items?.count ?? 0
    }
    init(items: [WisdomeListCellRow]? = nil, sectionTitle: String? = "", type: WisdomeTableSectionType) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.type = type
        
    }
}
struct WisdomeListCellRow {
    var rowType: WisdomeTableRowType? = nil
    var item: Article? = nil
}
