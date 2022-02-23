//
//  Manager.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-20.
//

import Foundation
class Manager{
    var item: [Stocks] = [Stocks]()
    var history: [History] = [History]()
    
    func addItem(n: String, p:Int, q: Int)
    {
        item.append(Stocks(pn: n, pq: p, pp: q))
    }
    func getItems()->[Stocks]
    {
        return item
    }
    
    func addHistory(hn: String,totalQuantity: Int,totalAmount: Int, Hdate: String )
    {
        history.append(History(name: hn, quantity: totalQuantity, total: totalAmount, date: Hdate))
    }

    func getHistory()->[History]
    {
        return history
    }
}
