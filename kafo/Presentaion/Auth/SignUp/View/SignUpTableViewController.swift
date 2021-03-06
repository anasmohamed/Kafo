//
//  SignUpTableViewController.swift
//  kafo
//
//  Created by no one on 19/06/2021.
//

import UIKit
import Toast_Swift
class SignUpTableViewController: UITableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var confiremPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
//    @IBOutlet weak var deteOfBirthTextField: UITextField!
    @IBOutlet weak var acceptTermsAndConditionLb: UILabel!
    @IBOutlet weak var mobileNameTextField: UITextField!
    @IBOutlet weak var locationCell: UITableViewCell!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var regiterBtn: UIButton!
//    @IBOutlet weak var femalCheckbox: Checkbox!
//    @IBOutlet weak var maleCheckbox: Checkbox!
    @IBOutlet weak var privacyPolicyCheckbox: Checkbox!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var signupViewModel = SignupViewModel()
    var gender = "male"
    var userType = ""
    let datePicker = UIDatePicker()
    var date : Date? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.backgroundView = UIImageView(image: UIImage(named: "background3"))
        setupRegisterBtn()
        let emailImage = UIImage(named:"envelope-3")
        let userImage = UIImage(named:"user-12")
        let callImage = UIImage(named:"call-2")
        let calenderImage = UIImage(named:"calendar")
        let passwordImage = UIImage(named:"padlock")
        addLeftImageTo(txtField: emailTextFiled, andImage: emailImage!)
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
        addLeftImageTo(txtField: confiremPasswordTextField, andImage: passwordImage!)
        addLeftImageTo(txtField: lastNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: firstNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: mobileNameTextField, andImage: callImage!)
//        addLeftImageTo(txtField: deteOfBirthTextField, andImage: calenderImage!)
        bindData()
        setDelegates()
        createDatePicker()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpTableViewController.tapFunction))
        acceptTermsAndConditionLb.isUserInteractionEnabled = true
        acceptTermsAndConditionLb.addGestureRecognizer(tap)
//        maleCheckbox.isChecked = true
        
        if userType != "client"
        {
            locationCell.isHidden = false
            
        }else{
            locationCell.isHidden = true
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc
     func tapFunction(sender:UITapGestureRecognizer) {
        let servicesViewStoryboard = UIStoryboard.init(name: "SignUpView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "TermsAndConditionsViewController")
//        servicesViewController.modalPresentationStyle = .fullScreen
        let navViewController = UINavigationController(rootViewController: servicesViewController)
        navViewController.modalPresentationStyle = .fullScreen
        self.present(navViewController, animated: true, completion: nil)
     }
    @IBAction func onFemaleCheckboxBtnDidTapped(_ sender: Any) {
//        maleCheckbox.isChecked = false
//        femalCheckbox.isChecked = true
        gender = "famel"
    }
    @IBAction func onMaleCheckboxBtnDidTapped(_ sender: Any) {
//        maleCheckbox.isChecked = true
//        femalCheckbox.isChecked = false
        gender = "male"
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
//        deteOfBirthTextField.inputAccessoryView = toolBar
//        deteOfBirthTextField.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
      
        datePicker.minimumDate = Date.yesterday
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    func bindData() {
        
        signupViewModel.signupSuccess.bind {user in
            //               LoadingIndicatorView.hide()
            print("success")
            if user != nil{
//            guard let email = $0?[1] else { return }
            self.navigateToServiceViewController()
                UserDefaults.standard.set(user?.email, forKey: "email")
                UserDefaults.standard.set(user?.firstName, forKey: "firstName")
                UserDefaults.standard.set(user?.lastName, forKey: "lastName")
                UserDefaults.standard.set(user?.gender, forKey: "gender")
                UserDefaults.standard.set(user?.mobileNumber, forKey: "mobileNumber")
                UserDefaults.standard.set(user?.userType, forKey: "userType")
                UserDefaults.standard.set(user?.token, forKey: "userId")
//                UserDefaults.standard.set(user?.dateOfBirth, forKey: "birthDate")


                self.view.makeToast("???? ?????????????? ??????????", duration: 3.0, position: .bottom)

            }
            
        }
        signupViewModel.isEmailTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.emailTextFiled)!)}
        }
        
        signupViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
        }
        signupViewModel.isConfirmPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.confiremPasswordTextField)!)}
        }
        signupViewModel.isUsernameTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.firstNameTextField)!)}
        }
        signupViewModel.isPhoneNumberTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.mobileNameTextField)!)}
        }
        signupViewModel.errorMessage.bind {
            //               LoadingIndicatorView.hide()
            
            guard let errorMessage = $0 else { return }
            var style = ToastStyle()
            
            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .black
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
        }
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        if userType != "client"{
            signupViewModel.updateCredentials(firstName: firstNameTextField.text!,lastName: lastNameTextField.text!, password: passwordTextField.text!,phoneNumber: mobileNameTextField.text!,email: emailTextFiled.text!,userType: userType,gender: gender,date:"",privacyPolicy:privacyPolicyCheckbox.isChecked,city: cityTextField.text!,country: countryTextField.text!,confirmPassword:confiremPasswordTextField.text!)
        }else{
            signupViewModel.updateCredentials(firstName: firstNameTextField.text!,lastName: lastNameTextField.text!, password: passwordTextField.text!,phoneNumber: mobileNameTextField.text!,email: emailTextFiled.text!,userType: userType,gender: gender,date:"",privacyPolicy:privacyPolicyCheckbox.isChecked,confirmPassword:confiremPasswordTextField.text!)
        }
        
        
        //Here we check user's credentials input - if it's correct we call login()
        switch signupViewModel.credentialsInput() {
        
        case .Correct:
            //                    LoadingIndicatorView.show()
            
            signupViewModel.signup()
        case .Incorrect:
            return
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    func setDelegates() {
        emailTextFiled.delegate = self
        passwordTextField.delegate = self
        confiremPasswordTextField.delegate = self
        firstNameTextField.delegate = self
        mobileNameTextField.delegate = self
    }
    func setupRegisterBtn()  {
        regiterBtn.layer.cornerRadius = 20
        regiterBtn.layer.borderWidth = 2
        regiterBtn.layer.borderColor = UIColor.yellow.cgColor
        
        backBtn.layer.cornerRadius = 20
        backBtn.layer.borderWidth = 2
        backBtn.layer.borderColor = UIColor.yellow.cgColor
    }
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController")
        let nav = UINavigationController(rootViewController: servicesViewController)
//        let nvc = servicesViewStoryboard.instantiateViewController(withIdentifier: "NVC") as! UINavigationController
//        nvc.pushViewController(servicesViewController, animated: true)
        servicesViewController.modalPresentationStyle = .fullScreen
        nav.modalPresentationStyle = .fullScreen
//                self.navigationController!.pushViewController(servicesViewController, animated: true)
                self.present(nav, animated: true,completion: nil)
    }
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    // MARK: - Table view data source
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            return 0
        }
        if userType != "client"{
            if indexPath.row == 5 {
                return 120
            }
        }else{
            if indexPath.row == 5 {
                return 0
            }
            
        }
        if indexPath.row == 4{
            return 190
        }
        if indexPath.row == 3 {
            return 68
        }
        if indexPath.row == 2{
            return 130
        }
        if indexPath.row == 7{
            return 100
            
        }
        return 200
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
//        deteOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
