//
//  HistoryDetailViewController.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-22.
//

import UIKit

class HistoryDetailViewController: UIViewController {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name: UILabel!
    var id = Int()
    var itemHistory = [History]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        print(id)
        name.text! += itemHistory[id].itemName
        date.text! += itemHistory[id].pcDate
        price.text! += String(itemHistory[id].totalPrice)
        quantity.text! += String(itemHistory[id].itemQuantity)
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
