//
//  OrderTableViewCell.swift
//  kafo
//
//  Created by no one on 16/09/2021.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var numberOfHoursLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var orderTimeLbl: UILabel!
    var item = Order(){
          didSet{
            moneyLbl.text = item.totalMoney
            numberOfHoursLbl.text = item.numberOfHours
            dateLbl.text = item.orderDate
            orderTimeLbl.text = item.orderTime
            
          }
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
