//
//  BodyGuardProfileViewControll.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation
import UIKit
class BodyGuardProfileControll: UIViewController {
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    
    var email : String = ""
    var mobile : String = ""
    var location : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        emailLbl.text = email
        mobileLbl.text = mobile
        locationLbl.text = location
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.topView.bounds
                
        self.topView.layer.insertSublayer(gradientLayer, at:0)
    }
    
    @IBAction func continueBtnDidTapped(_ sender: Any) {
    }
    
}
