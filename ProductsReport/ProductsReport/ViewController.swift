//
//  ViewController.swift
//  ProductsReport
//
//  Created by developer on 6/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    let reportGenerator = ReportGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getReport()
    }

    func getReport() {
        reportGenerator.generate()
    }
}

