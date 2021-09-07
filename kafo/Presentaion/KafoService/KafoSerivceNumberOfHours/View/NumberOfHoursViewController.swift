//
//  NumberOfHoursViewController.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit
import Toast_Swift
class NumberOfHoursViewController: UIViewController {
    
    @IBOutlet weak var checkoutBtn: UIButton!
    @IBOutlet weak var bodygaurdPhoto: UIImageView!
    @IBOutlet weak var enterNumberOfBodyGuardsLbl: UILabel!
    @IBOutlet weak var numberOfHoursTextField: UITextField!
    var isMale = false
    @IBOutlet weak var numberOfDaysTextField: UITextField!
    
    @IBOutlet weak var serviceStartDateTextField: UITextField!
    let datePicker = UIDatePicker()
    var date : Date? = nil
    var gender = "male"
    var user : User?
    var kafoServiceViewModel = KafoServieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isMale{
            bodygaurdPhoto.image = UIImage(named: "male")
            enterNumberOfBodyGuardsLbl.text = "ادخل عدد الحراس"
            gender = "male"
        }else{
            gender = "femal"
            bodygaurdPhoto.image = UIImage(named: "women")
            enterNumberOfBodyGuardsLbl.text = "ادخل عدد الحراسات"
            
        }
        numberOfHoursTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
        numberOfHoursTextField.layer.borderWidth = 1
        numberOfHoursTextField.layer.cornerRadius = 8
        
        checkoutBtn.layer.borderColor = UIColor.black.cgColor
        checkoutBtn.layer.borderWidth = 2
        checkoutBtn.layer.cornerRadius = 20
        bindData()
        setDelegates()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        serviceStartDateTextField.inputAccessoryView = toolBar
        serviceStartDateTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
        serviceStartDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    func bindData() {
        
        
        kafoServiceViewModel.isNumberOfDaysTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfDaysTextField)!)}
        }
        
        kafoServiceViewModel.isServiceStartDateTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.serviceStartDateTextField)!)}
        }
        kafoServiceViewModel.isNumberOfBodyGuardTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfHoursTextField)!)}
        }
        kafoServiceViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
            var style = ToastStyle()
            
            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .red
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func setDelegates() {
        serviceStartDateTextField.delegate = self
        numberOfDaysTextField.delegate = self
        numberOfHoursTextField.delegate = self
        
    }
    
    
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)
        
        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        self.present(sideMenuViewController, animated: true)
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
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController") as! ServicesTableViewController
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    @IBAction func checkoutBtnDidTapped(_ sender: Any) {
//        kafoServiceViewModel.update(gender: gender, and: numberOfDaysTextField.text!, numberOfBodyGuard: numberOfHoursTextField.text!, serviceStartDate: serviceStartDateTextField.text!,)
        
        
        //Here we check user's credentials input - if it's correct we call login()
        switch kafoServiceViewModel.credentialsInput() {
        
        case .Correct:
            //                    LoadingIndicatorView.show()
            
            kafoServiceViewModel.setOrder()
            navigateToServiceViewController()
        case .Incorrect:
            return
        }
    }
    
}
extension NumberOfHoursViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberOfDaysTextField.resignFirstResponder()
        numberOfHoursTextField.resignFirstResponder()
        serviceStartDateTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        numberOfDaysTextField.layer.borderWidth = 0
        numberOfHoursTextField.layer.borderWidth = 0
        serviceStartDateTextField.layer.borderWidth = 0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
