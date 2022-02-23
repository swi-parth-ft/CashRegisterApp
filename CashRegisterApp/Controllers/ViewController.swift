//
//  ViewController.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-19.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,
                      UITableViewDataSource {

    
    @IBOutlet weak var tableDisplay: UITableView!
    
  
    @IBOutlet weak var QuantityDisplay: UILabel!
    @IBOutlet weak var ProductNameDisplay: UILabel!
    @IBOutlet weak var totalDisplay: UILabel!
    var items: Manager?
    var his: Manager?
    var index = 0
    var loadNumber = 0
    var loadQuantity = 0
    var addForBuy = 0
    var Stock = [Stocks]()
    var manager: Manager = Manager()
    var itemName:[String] = ["Pants","Shoes","Hats","Tshirts","Dresses"]
    var itemQuantity: [Int] = [20,50,10,10,24]
    var itemPrice: [Float] = [50.9,90,20.5,21.75,69.53]
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        tableDisplay.dataSource=self
        tableDisplay.delegate = self
        navigationItem.title = "Cash Register"
        items = (UIApplication.shared.delegate as! AppDelegate).collection
   
        for i in 0..<itemName.count
        {
            items?.addItem(n: itemName[i], p: itemQuantity[i], q: Int(itemPrice[i]))
        }
        tableDisplay.reloadData()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableDisplay.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.item.count ?? 0

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        print(indexPath.row)
        cell.name.text = items?.item[indexPath.row].pname
        cell.quantity.text = String(items?.item[indexPath.row].quantity ?? 0)
        cell.price.text! = String(items?.item[indexPath.row].price ?? 0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        index = indexPath.row


        var selectedTrail = items?.item[indexPath.row].pname
        var selectQty = Int(QuantityDisplay.text!) ?? 0
        var productPrice = items?.item[indexPath.row].price ?? 0
        var totalAmount = selectQty * Int(productPrice)
        print(selectedTrail)
        if (selectedTrail != ""){

         ProductNameDisplay.text = selectedTrail
         totalDisplay.text = String(totalAmount)
         loadQuantity = selectQty

       }
    }
 
    
    
    
    @IBAction func BuyBtnClicked(_ sender: Any) {
        let amountForHistory = totalDisplay.text!
        let nameForHistory = ProductNameDisplay.text!
        let qtyEntered = Int(QuantityDisplay.text!)!
        let QtyLeft = items?.item[index].quantity
        if(qtyEntered > QtyLeft!){
            let alert = UIAlertController(title: "Quantity Error", message: "Quantity exceed Avaliablity", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Reselect", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            QuantityDisplay.text = ""
            totalDisplay.text = ""
        }
        else{
        items?.item[index].quantity = QtyLeft! - qtyEntered
            
            let date = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyyy, HH:mm:ss"
            items?.addHistory(hn: nameForHistory, totalQuantity: qtyEntered, totalAmount: Int(amountForHistory)!,Hdate: dateformatter.string(for: date)!); 
        }
   
      tableDisplay.reloadData()
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if(sender.tag == 1){
            QuantityDisplay.text! += "1"
       
        }
        else if(sender.tag == 2){
            QuantityDisplay.text! += "2"
        }
        else if(sender.tag == 3){
            QuantityDisplay.text! += "3"
           
        }
        else if(sender.tag == 4){
            QuantityDisplay.text! += "4"
            
        }
        else if(sender.tag == 5){
            QuantityDisplay.text! += "5"
            
        }
        else if(sender.tag == 6){
            QuantityDisplay.text! += "6"
            
        }
        else if(sender.tag == 7){
            QuantityDisplay.text! += "7"
          
        }
        else if(sender.tag == 8){
            QuantityDisplay.text! += "8"
          
        }
        else if(sender.tag == 9){
            QuantityDisplay.text! += "9"
           
        }
        else if(sender.tag == 0){
            QuantityDisplay.text! += "0"
         
        }
        else if(sender.tag == 11){
            QuantityDisplay.text! = ""
         
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? OptionsViewController
        MVC!.itemList = items!.item
        MVC!.historyList = items!.history
    }
    
    
   
    
    
}

