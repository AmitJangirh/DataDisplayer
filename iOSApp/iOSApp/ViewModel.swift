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
    var rowData: [StringConvertable]
}

// MARK: - StringConvertable

protocol StringConvertable {
    var stringValue: String { get }
}

// MARK: - Row Data

protocol RowData: StringConvertable {
    associatedtype RawData
    var rawValue: RawData { get set }
}

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
        return self.sectionArray[section].rowData.count
    }
    
    subscript(section section: Int) -> SectionData {
        return self.sectionArray[section]
    }
    
    subscript(valueAt indexPath: IndexPath) -> String {
        let data = self[section: indexPath.section].rowData[indexPath.row]
        return data.stringValue
    }
}

// MARK: - Sample Data
struct IntData: RowData {
    typealias RawData = Int
    var rawValue: Int
    
    var stringValue: String {
        return String(rawValue)
    }
    
    static var dataArray: [IntData] {
        [IntData(rawValue: 1),
         IntData(rawValue: 2),
         IntData(rawValue: 3),
         IntData(rawValue: 4)]
    }
}

struct CharData: RowData {
    typealias RawData = Character
    var rawValue: Character
    
    var stringValue: String {
        return "\(rawValue)"
    }
    
    static var dataArray: [CharData] {
        [CharData(rawValue: "A"),
         CharData(rawValue: "B"),
         CharData(rawValue: "C"),
         CharData(rawValue: "D")]
    }
}

struct EmployeeData {
    var name: String
    var id: Int
}

struct CustomData: RowData {
    typealias RawData = EmployeeData
    var rawValue: EmployeeData
    
    var stringValue: String {
        return "Name: " + rawValue.name + ", id: \(rawValue.id)"
    }
    
    static var dataArray: [CustomData] {
        [CustomData(rawValue: EmployeeData(name: "AJ", id: 123)),
         CustomData(rawValue: EmployeeData(name: "DL", id: 123)),
         CustomData(rawValue: EmployeeData(name: "LALA", id: 123)),
         CustomData(rawValue: EmployeeData(name: "OK", id: 123))]
    }
}

var sections: [SectionData] = [SectionData(title: "Alphabet", rowData: CharData.dataArray),
                               SectionData(title: "Numeric", rowData: IntData.dataArray),
                               SectionData(title: "EmployeeData", rowData: CustomData.dataArray)]
