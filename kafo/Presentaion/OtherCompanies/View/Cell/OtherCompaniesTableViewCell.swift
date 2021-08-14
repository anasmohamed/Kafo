//
//  OtherCompaniesTableViewCell.swift
//  kafo
//
//  Created by no one on 14/08/2021.
//

import UIKit

class OtherCompaniesTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var companyNameView: UIView!
    @IBOutlet weak var companyPhoto: UIImageView!
    @IBOutlet weak var companyNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        
        containerView.backgroundColor = UIColor.clear
        companyNameView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
