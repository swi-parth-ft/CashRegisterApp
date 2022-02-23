//
//  History.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-20.
//

import Foundation
class History
{
    var itemName : String
    var itemQuantity : Int
    var totalPrice: Int
    var pcDate: String
    
    init(name : String, quantity: Int, total: Int, date: String)
    {
        itemName = name
        itemQuantity = quantity
        totalPrice = total
        pcDate = date
    }
}
