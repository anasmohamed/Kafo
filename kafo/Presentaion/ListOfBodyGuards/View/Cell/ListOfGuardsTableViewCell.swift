//
//  ListOfGuardsTableViewCell.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class ListOfGuardsTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyguardNameUIView: UIView!
    @IBOutlet weak var bodyguardNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyguardNameUIView.layer.borderWidth = 2
        bodyguardNameUIView.layer.cornerRadius = 7
        bodyguardNameUIView.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
