//
//  FacilitiesSccurityApplicationViewController.swift
//  kafo
//
//  Created by no one on 14/08/2021.
//

import UIKit
import Toast_Swift
class FacilitiesSccurityApplicationViewController: UITableViewController {
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var facilityMobileNumberTextField: UITextField!
    @IBOutlet weak var numberOfDaysTextField: UITextField!
    @IBOutlet weak var numberOfShiftTextField: UITextField!
    @IBOutlet weak var numberOfBodyguarsTextField: UITextField!
    @IBOutlet weak var faxTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var responsiblePersonTextField: UITextField!
    @IBOutlet weak var buildingNumberTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var facilityNameTextField: UITextField!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    let datePicker = UIDatePicker()
    var date : Date? = nil
    var user : User?
    var facilitiesSccurityApplicationViewModel =  FacilitiesSccurityApplicationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.layer.cornerRadius = 15
        doneBtn.layer.borderColor = UIColor.black.cgColor
        doneBtn.layer.borderWidth = 1
        roundView(view: facilityNameTextField)
        roundView(view: cityTextField)
        roundView(view: streetTextField)
        roundView(view: buildingNumberTextField)
        roundView(view: responsiblePersonTextField)
        roundView(view: mobileTextField)
        roundView(view: faxTextField)
        roundView(view: numberOfBodyguarsTextField)
        roundView(view: numberOfShiftTextField)
        roundView(view: facilityMobileNumberTextField)
        roundView(view: numberOfDaysTextField)
        roundView(view: startDateTextField)
        createDatePicker()

        setDelegates()
        bindData()
        // Do any additional setup after loading the view.
    }
    func bindData() {
        
        
        facilitiesSccurityApplicationViewModel.isNumberOfDaysTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfDaysTextField)!)}
        }
        
        facilitiesSccurityApplicationViewModel.isStreetTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.streetTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isNumberOfBodyGuardTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfBodyguarsTextField)!)}
        }
        
        facilitiesSccurityApplicationViewModel.isFaxTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.faxTextField)!)}
        }
        
        facilitiesSccurityApplicationViewModel.isMobileTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.mobileTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isCityTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.cityTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isBuildingNumberTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.buildingNumberTextField)!)}
        }
        
        facilitiesSccurityApplicationViewModel.isFacilityNameTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.facilityNameTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isStartDateTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.startDateTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isNumberOfDaysTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfDaysTextField)!)}
        }
        
        facilitiesSccurityApplicationViewModel.isFacilityMobileNumberTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.facilityMobileNumberTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isResponsiblePersonTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.responsiblePersonTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.isNumberOfShiftTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.numberOfShiftTextField)!)}
        }
        facilitiesSccurityApplicationViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
            var style = ToastStyle()
            
            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .black
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
        }
    }
    func roundView(view:UIView){
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    @objc func selectDatedoneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
        startDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    
    func setDelegates() {
        
        startDateTextField.delegate = self
        facilityMobileNumberTextField.delegate = self
        numberOfDaysTextField.delegate = self
        numberOfShiftTextField.delegate = self
        numberOfBodyguarsTextField.delegate = self
        faxTextField.delegate = self
        mobileTextField.delegate = self
        responsiblePersonTextField.delegate = self
        buildingNumberTextField.delegate = self
        streetTextField.delegate = self
        cityTextField.delegate = self
        facilityNameTextField.delegate = self
    }
    
    func getUserData()  {
    
        user?.email = UserDefaults.standard.string(forKey: "email") ?? ""
        user?.firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        user?.lastName =  UserDefaults.standard.string(forKey: "lastName") ?? ""
        user?.gender = UserDefaults.standard.string(forKey: "gender") ?? ""
        user?.mobileNumber = UserDefaults.standard.string(forKey: "mobileNumber") ?? ""
    }
    @IBAction func doneBtnDidTapped(_ sender: Any) {
        facilitiesSccurityApplicationViewModel.update(facilityName: facilityNameTextField.text!, city: cityTextField.text!, street: streetTextField.text!, buildingNumber: buildingNumberTextField.text!, responsiblePerson:responsiblePersonTextField.text!, mobile: mobileTextField.text!, facilityMobileNumber: facilityNameTextField.text!, fax: buildingNumberTextField.text!, numberOfBodyGuard: numberOfBodyguarsTextField.text!, startDate: startDateTextField.text!, numberOfDays: numberOfDaysTextField.text!, numberOfShift: numberOfShiftTextField.text!)
        
        
        //Here we check user's credentials input - if it's correct we call login()
        switch facilitiesSccurityApplicationViewModel.credentialsInput() {
        
        case .Correct:
            //                    LoadingIndicatorView.show()
            
            facilitiesSccurityApplicationViewModel.setOrder()
           
            navigateToServiceViewController()
        case .Incorrect:
            return
        }
    }
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController") as! ServicesTableViewController
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    func setGradientBackground() {
        
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.tableView.bounds
        
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
        //        self.tableView.layer.insertSublayer(gradientLayer, at:0)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)
        
        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        sideMenuViewController.modalPresentationStyle = .formSheet
        self.present(sideMenuViewController, animated: true)
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
extension FacilitiesSccurityApplicationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        startDateTextField.resignFirstResponder()
        facilityMobileNumberTextField.resignFirstResponder()
        numberOfDaysTextField.resignFirstResponder()
        numberOfShiftTextField.resignFirstResponder()
        numberOfBodyguarsTextField.resignFirstResponder()
        faxTextField.resignFirstResponder()
        mobileTextField.resignFirstResponder()
        responsiblePersonTextField.resignFirstResponder()
        buildingNumberTextField.resignFirstResponder()
        streetTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        facilityNameTextField.resignFirstResponder()
        return true
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(selectDatedoneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        startDateTextField.inputAccessoryView = toolBar
        startDateTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        startDateTextField.layer.borderWidth = 0
//        facilityMobileNumberTextField.layer.borderWidth = 0
//        numberOfDaysTextField.layer.borderWidth = 0
//        numberOfShiftTextField.layer.borderWidth = 0
//        numberOfBodyguarsTextField.layer.borderWidth = 0
//        faxTextField.layer.borderWidth = 0
//        mobileTextField.layer.borderWidth = 0
//        responsiblePersonTextField.layer.borderWidth = 0
//        buildingNumberTextField.layer.borderWidth = 0
//        streetTextField.layer.borderWidth = 0
//        cityTextField.layer.borderWidth = 0
//        facilityNameTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

