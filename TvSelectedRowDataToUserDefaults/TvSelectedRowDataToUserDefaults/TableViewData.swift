//
//  TableViewData.swift
//  TvSelectedRowDataToUserDefaults
//
//  Created by Srans022019 on 21/04/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import Foundation
import UIKit

class TableViewData: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var selectedArr = ["VIkas", "VInay", "Rohan", "ABCD", "EFCG"]
    
    var selectedRows: [Int] = [] {
        didSet {
            table.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        selectedRows = UserDefaults.standard.value(forKey: "selectedRows") as? [Int] ?? []
        
    }
}

extension TableViewData: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = selectedArr[indexPath.row]
        
        cell.accessoryType = selectedRows.contains(indexPath.row) ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedRows.contains(indexPath.row) {
            self.selectedRows = selectedRows.filter{$0 != indexPath.row}
        }else{
            self.selectedRows.append(indexPath.row)
        }
        
        UserDefaults.standard.set(selectedRows, forKey: "selectedRows")
        
    }
    
    
}
