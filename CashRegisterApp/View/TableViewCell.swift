//
//  TableViewCell.swift
//  CashRegisterApp
//
//  Created by Parth Antala on 2022-02-22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
