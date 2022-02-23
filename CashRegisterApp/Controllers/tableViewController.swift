//
//  tableViewController.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-20.
//

import UIKit

class tableViewController: UIViewController,UITableViewDelegate,
                           UITableViewDataSource {

    var itemList1 = [Stocks]()
    var index: Int = 0
    var flag = 0
    
    @IBOutlet weak var newQuantity: UITextField!
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource=self
        myTable.delegate=self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList1.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "recell", for: indexPath)

        cell1.textLabel?.text = itemList1[indexPath.row].pname
        cell1.detailTextLabel?.text = String(itemList1[indexPath.row].quantity)
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        flag = 1;
        index = indexPath.row
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if(flag==1){
            itemList1[index].quantity = Int(newQuantity.text!)!
            myTable.reloadData()
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Please Select an Item before Restocking", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
        }
          
     
        
    }
    
    @IBAction func close(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }


}
