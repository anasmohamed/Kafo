//
//  SignUpTableViewController.swift
//  kafo
//
//  Created by no one on 19/06/2021.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var confiremPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var deteOfBirthTextField: UITextField!
    @IBOutlet weak var mobileNameTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var regiterBtn: UIButton!
    @IBOutlet weak var femalCheckbox: Checkbox!
    @IBOutlet weak var maleCheckbox: Checkbox!
    
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
        addLeftImageTo(txtField: deteOfBirthTextField, andImage: calenderImage!)
        bindData()
        setDelegates()
        createDatePicker()
        maleCheckbox.isChecked = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func onFemaleCheckboxBtnDidTapped(_ sender: Any) {
        maleCheckbox.isChecked = false
        femalCheckbox.isChecked = true
        gender = "famel"
    }
    @IBAction func onMaleCheckboxBtnDidTapped(_ sender: Any) {
        maleCheckbox.isChecked = true
        femalCheckbox.isChecked = false
        gender = "male"
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        deteOfBirthTextField.inputAccessoryView = toolBar
        deteOfBirthTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    func bindData() {
        
        signupViewModel.signupSuccess.bind {_ in
            //               LoadingIndicatorView.hide()
            print("success")
            //               guard let email = $0?[1] else { return }
            //               let homeViewStoryboard = UIStoryboard.init(name: "MainView", bundle: nil)
            //               let homeViewController = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeTabBar")
            ////               self.signupViewModel.sbaveUser(userToken: $0![0])
            //               print("token\($0?[0])")
            //               homeViewController.modalPresentationStyle = .fullScreen
            //               self.present(homeViewController, animated: true, completion: nil)
            //               UserDefaults.standard.set(email, forKey: "email")
            //               UserDefaults.standard.set($0![0], forKey: "token")
            
            
        }
        signupViewModel.isEmailTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.emailTextFiled)!)}
        }
        
        signupViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
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
            //               var style = ToastStyle()
            
            //               // this is just one of many style options
            //               style.messageColor = .white
            //               style.backgroundColor = .red
            //               style.messageFont = UIFont(name:"Cairo-Regular" , size:20.0)!
            //               self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
            //            AlertController.showAllert(title: "Error", message: errorMessage, allertType: .error)
        }
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        signupViewModel.updateCredentials(firstName: firstNameTextField.text!,lastName: lastNameTextField.text!, password: passwordTextField.text!,phoneNumber: mobileNameTextField.text!,email: emailTextFiled.text!,userType: userType,gender: gender,date:deteOfBirthTextField.text!)
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
        deteOfBirthTextField.text = formatter.string(from: datePicker.date)
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
