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
            bodyguardNameLbl.text = item.firstName + " " + item.lastName
            
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
