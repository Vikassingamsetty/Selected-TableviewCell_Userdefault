//
//  ViewController.swift
//  TvSelectedRowDataToUserDefaults
//
//  Created by Srans022019 on 21/04/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextBtnTap(_ sender: Any) {
        
        let next = storyboard?.instantiateViewController(withIdentifier: "TableViewDataID") as! TableViewData
        
        present(next, animated: true, completion: nil)
        
    }
    
}

