//
//  BodyGaurdNumberOfHoursViewController.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import UIKit

class BodyGaurdNumberOfHoursViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var totalMoneyLbl: UILabel!
    @IBOutlet weak var numberOfHoursTextField: UITextField!
    
    var bodyGuardName = ""
    var bodyGuardEmail = ""
    var bodyGuardMobileNumber = ""
    var bodyGuardLocation = ""
    var clientName = ""
    var clientMobileNumber = ""
    var clientEmail = ""
    var bodyguardId = ""
    var listOfBodyGuardsViewModel = ListOfBodyGuardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        numberOfHoursTextField.delegate = self
        self.numberOfHoursTextField.addTarget(totalMoneyLbl, action: #selector(UILabel.input(textField:)), for: .editingChanged)
        doneBtn.layer.cornerRadius = 15
        doneBtn.layer.borderColor = UIColor.black.cgColor
        doneBtn.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func doneBtnDidTapped(_ sender: Any) {
        //Here we check user's credentials input - if it's correct we call login()
        listOfBodyGuardsViewModel.update(totalMoney: totalMoneyLbl.text!, and: numberOfHoursTextField.text!, bodyGuardName: bodyGuardName, bodygauardMobileNumber: bodyGuardMobileNumber, bodyguardEmail: bodyGuardEmail, bodyguardLocation: bodyGuardLocation, clinetName:clientName , clientMobileNumber: clientMobileNumber, clientEmail: clientEmail,bodyguardId: bodyguardId)
        switch listOfBodyGuardsViewModel.credentialsInput() {
        
        case .Correct:
            listOfBodyGuardsViewModel.setOrder()
            if !totalMoneyLbl.text!.isEmpty || Int(totalMoneyLbl.text!) != 0{
                navigateToServiceViewController()}
            
        case .Incorrect:
            return
        }
    }
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController") as! ServicesTableViewController
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension UILabel {
    @objc
    
    func input(textField: UITextField) {
        self.text =  String( Int(textField.text!) ?? 0 * 100)
       
    }
}
