//
//  ReportGenerator.swift
//  ProductsReport
//
//  Created by developer on 6/27/22.
//

import Foundation

class ReportGenerator {
    
    
    var report: String = ""
    
    var productEntries: [String] = []
    var clearance: [String] = []
    var noClearance: [String] = []
    var itemsInCart: Int = 0
    
    func getEntries() {
        getData()
        let lines = report.split(separator: "\n")
        for i in 0...lines.count-1 {
            let entry = String(lines[i])
            if entry.split(separator: ",")[0] == "Product" {
                checkClearance(entry: entry)
                productEntries.append(entry)
            }
        }
    }
    
    
    func getData() {
        let path = Bundle.main.url(forResource: "data", withExtension: "txt")!
        do {
            let string = try String(contentsOf: path, encoding: String.Encoding.utf8)
            report = string
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkClearance(entry: String) {
        let data = entry.split(separator: ",")
        let normalPrice = Float(data[1])!
        let clearancePrice = Float(data[2])!
        let quantity = Int(data[3])!
        let hidden = data[4]
        
        if hidden == "true" {
            itemsInCart + 1
        }
        
        if clearancePrice < normalPrice {
            clearance.append(entry)
        } else {
            noClearance.append(entry)
        }
    }
    
    func generate() {
        getEntries()
        print(clearance)
        print(noClearance)
        print(itemsInCart)
    }
}
