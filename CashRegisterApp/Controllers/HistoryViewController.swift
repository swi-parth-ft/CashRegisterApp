//
//  HistoryViewController.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-20.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,
                             UITableViewDataSource {
    
    @IBOutlet weak var historyTable: UITableView!
    var historyList1 = [History]()
    
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.dataSource=self
                historyTable.delegate = self
        historyTable.reloadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyList1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "hcell", for: indexPath)

        cell1.textLabel?.text = historyList1[indexPath.row].itemName
        cell1.detailTextLabel?.text = String(historyList1[indexPath.row].itemQuantity)
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.index = indexPath.row
       performSegue(withIdentifier: "HistoryDetail", sender: self)
        print("hi \(index)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? HistoryDetailViewController
        MVC!.itemHistory = historyList1
        MVC!.id = self.index
    }
    
   
    


}
