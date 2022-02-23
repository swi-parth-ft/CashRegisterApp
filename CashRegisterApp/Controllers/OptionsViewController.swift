//
//  OptionsViewController.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-20.
//

import UIKit

class OptionsViewController: UIViewController {
    var itemList = [Stocks]()
    var historyList = [History]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "history")
        {
            let MVC1 = segue.destination as? HistoryViewController
            MVC1!.historyList1 = historyList
        }
        if(segue.identifier == "updateScreen")
        {
            let MVC2 = segue.destination as? tableViewController
            MVC2?.itemList1 = itemList
        }
        
     
    }


}
