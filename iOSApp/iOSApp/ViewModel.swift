//
//  viewModel.swift
//  iOSApp
//
//  Created by Amit Jangirh on 14/06/21.
//

import Foundation

// MARK: - Requirement
/* Data representation
 Section 1
    Title - ALphabet
        A
        B
        C
 Section 2
    Title - Numberic
        1
        2
        3
 */

// MARK: - Section Data
struct SectionData {
    var title: String
    var rowData: RowData
}

// MARK: - Row Data
struct RowData {
    var rowDataArray: [String]
}

protocol Data {
    associatedtype RawData
    var rawValue: RawData { get set }
    var stringValue: String { get }
}

//protocol RowData {
//    associatedtype Data
//    var dataArray: [Data] { get set }
//}

// MARK: - ViewModel
struct ViewModel {
    var sectionArray: [SectionData]
    
    init(sectionArray: [SectionData]) {
        self.sectionArray = sectionArray
    }
    
    func sectionCount() -> Int {
        return sectionArray.count
    }
    
    func rowCount(at section: Int) -> Int {
        return self.sectionArray[section].rowData.rowDataArray.count
    }
    
    subscript(section section: Int) -> SectionData {
        return self.sectionArray[section]
    }
    
    subscript(valueAt indexPath: IndexPath) -> String {
        let data = self[section: indexPath.section].rowData.rowDataArray[indexPath.row]
        return "\(data)"
    }
}

// MARK: - Sample Data
let alphabetArray = RowData(rowDataArray: ["A", "B", "C", "D"])
let intArray = RowData(rowDataArray: ["1", "2", "3", "4"])

var sections: [SectionData] = [SectionData(title: "Alphabet", rowData: alphabetArray),
                               SectionData(title: "Numeric", rowData: intArray)]

