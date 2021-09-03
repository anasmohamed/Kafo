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
    var bodyGuardName = ""
    var clientName = ""
    var clientEmail = ""
    var clientMobileNumber = ""
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        emailLbl.text = email
        mobileLbl.text = mobile
        locationLbl.text = location
        continueBtn.layer.cornerRadius = 15
        continueBtn.layer.borderColor = UIColor.black.cgColor
        continueBtn.layer.borderWidth = 1
        
        
        
        
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
        let bodyGuardProfileViewStoryboard = UIStoryboard(name: "ListOfBodyGuards", bundle: nil)
        let bodyGuardProfileViewControll = bodyGuardProfileViewStoryboard.instantiateViewController(identifier: "BodyGaurdNumberOfHoursViewController") as! BodyGaurdNumberOfHoursViewController
        bodyGuardProfileViewControll.bodyGuardName = bodyGuardName
        bodyGuardProfileViewControll.bodyGuardEmail = email
        bodyGuardProfileViewControll.bodyGuardLocation = location
        bodyGuardProfileViewControll.bodyGuardMobileNumber = mobile
        bodyGuardProfileViewControll.clientEmail = user!.email
        bodyGuardProfileViewControll.clientName = user!.firstName  + " " + user!.lastName
        bodyGuardProfileViewControll.clientMobileNumber = user!.mobileNumber
        self.navigationController?.pushViewController(bodyGuardProfileViewControll, animated: true)
    }
    
}
