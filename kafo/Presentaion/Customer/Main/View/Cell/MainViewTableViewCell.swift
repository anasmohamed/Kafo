//
//  MainViewTableViewCell.swift
//  kafo
//
//  Created by no one on 21/06/2021.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var companyNameLblView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.init(red:68.0/255.0 , green: 68.0/255.0, blue:68.0/255.0 , alpha: 1.0)
        self.companyNameLblView.backgroundColor = UIColor.init(red:68.0/255.0 , green: 68.0/255.0, blue:68.0/255.0 , alpha: 1.0)
        companyNameLblView.layer.cornerRadius = 7
        companyNameLblView.layer.borderColor = UIColor.init(red:187.0/255.0 , green: 180.0/255.0, blue:57.0/255.0 , alpha: 1.0).cgColor
        
        companyNameLblView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        containerView.layer.shadowRadius = 10.0
        containerView.layer.shadowOpacity = 0.7
             
             
        mainView.layer.cornerRadius = 7
        mainView.layer.borderColor = UIColor.white.cgColor
        mainView.layer.borderWidth = 1
        mainView.clipsToBounds = true
             
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
