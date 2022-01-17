//
//  ListOfGuardsTableViewCell.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class ListOfGuardsTableViewCell: UITableViewCell {

    @IBOutlet weak var distanseLbl: UILabel!
    @IBOutlet weak var bodyguardNameUIView: UIView!
    @IBOutlet weak var bodyguardNameLbl: UILabel!
    @IBOutlet weak var bodyGaurdImageView: UIImageView!
    var item = User(){
          didSet{
          var names = item.firstName.split(separator: " ")
            if names.count < 2{
            bodyguardNameLbl.text = item.firstName + " " + item.lastName
            }else{
                bodyguardNameLbl.text = item.firstName
            }
          }
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyGaurdImageView.layer.cornerRadius = bodyGaurdImageView.frame.height / 2
    
        bodyGaurdImageView.layer.borderWidth = 2
        bodyGaurdImageView.layer.borderColor = UIColor.black.cgColor

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
