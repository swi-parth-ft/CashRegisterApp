//
//  Stocks.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-19.
//

import Foundation

class Stocks{
 
    var pname: String = ""
    var quantity: Int = 0
    var price: Int = 0

    init(pn: String, pq: Int, pp: Int){
        pname = pn
        quantity = pq
        price = pp
    }
}
